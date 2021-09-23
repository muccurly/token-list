import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jurta_app/src/business_logic/sort/cubit/sort_cubit.dart';
import 'package:jurta_app/src/business_logic/sort/models/models.dart';
import 'package:jurta_app/src/business_logic/sort/sort.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/entity/range.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';
import 'package:jurta_app/src/data/repository/i_dictionary_repository.dart';
import 'package:jurta_app/src/data/repository/i_property_repository.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

part 'search_mini_event.dart';

part 'search_mini_state.dart';

class SearchMiniBloc extends Bloc<SearchMiniEvent, SearchMiniState> {
  SearchMiniBloc({
    required IDictionaryRepository dictionaryRepository,
    required IPropertyRepository propertyRepository,
    required SortCubit sortCubit,
  })  : _dictionaryRepository = dictionaryRepository,
        _propertyRepository = propertyRepository,
        _sortCubit = sortCubit,
        super(SearchMiniState()) {
    _sortStreamSubscription = _sortCubit.stream.listen(
      (event) => add(
        SortMiniChanged(
            direction: event.direction,
            sortField: event.sortField,
            toSearch: event.toSearch),
      ),
    );
  }

  final IDictionaryRepository _dictionaryRepository;
  final IPropertyRepository _propertyRepository;
  final SortCubit _sortCubit;

  late StreamSubscription<SortState> _sortStreamSubscription;

  @override
  Future<void> close() {
    _sortStreamSubscription.cancel();
    return super.close();
  }

  @override
  Stream<SearchMiniState> mapEventToState(SearchMiniEvent event) async* {
    if (event is SearchMiniGetObjectTypes)
      yield await _mapSearchMiniGetObjectTypesToState();
    else if (event is SearchMiniObjectTypeChoose)
      yield state.copyWith(
        filter: state.filter.copyWith(
            objectTypeId: event.type.id,
            atelier: null,
            exchange: null,
            probabilityOfBidding: null,
            encumbrance: null),
      );
    else if (event is SearchMiniRoomsPressed)
      yield _mapRoomsPressedToState(event);
    else if (event is SearchMiniMoreThan5Pressed)
      yield state.copyWith(
        filter: state.filter
            .copyWith(moreThanFiveRooms: !state.filter.moreThanFiveRooms),
      );
    else if (event is SearchMiniPriceRangeChanged)
      yield state.copyWith(
        filter: state.filter
            .copyWith(priceRange: Range(from: event.from, to: event.to)),
      );
    else if (event is SearchMiniAreaRangeChanged)
      yield state.copyWith(
        filter: state.filter
            .copyWith(areaRange: Range(from: event.from, to: event.to)),
      );
    else if (event is SearchMiniReset)
      yield state.copyWith(
          filter: state.filter.copyWith(
              areaRange: const Range(),
              priceRange: const Range(),
              numberOfRooms: <int>[],
              moreThanFiveRooms: false));
    else if (event is SearchMiniProperties)
      yield* _mapSearchPropertiesToState();
    else if (event is SearchMiniMore)
      yield* _mapSearchMiniMoreToState();
    else if (event is SortMiniChanged) yield* _mapSortChangedToState(event);
  }

  Future<SearchMiniState> _mapSearchMiniGetObjectTypesToState() async {
    if (_dictionaryRepository.types.isEmpty)
      await _dictionaryRepository.findAllObjectTypes();
    return state.copyWith(objectTypes: _dictionaryRepository.types);
  }

  SearchMiniState _mapRoomsPressedToState(SearchMiniRoomsPressed event) {
    var list = <int>[];
    list.addAll(state.filter.numberOfRooms);
    if (list.contains(event.number))
      list.removeWhere((it) => it == event.number);
    else
      list.add(event.number);
    return state.copyWith(filter: state.filter.copyWith(numberOfRooms: list));
  }

  Stream<SearchMiniState> _mapSearchPropertiesToState() async* {
    if (await InternetConnectionChecker().hasConnection) {
      yield state.copyWith(searchStatus: FormzStatus.submissionInProgress);
      try {
        List<RealProperty> props = await _propertyRepository
            .searchRealProperty(state.filter.copyWith(pageNumber: 0));
        yield state.copyWith(
            properties: props,
            searchStatus: FormzStatus.submissionSuccess,
            filter: state.filter.copyWith(
                pageNumber: _propertyRepository.searchPagination!.pageNumber));
        return;
      } on DioError catch (e) {
        MyLogger.instance.log.e(e.message);
      } catch (_) {
        MyLogger.instance.log.e(_.toString());
      }
      yield state.copyWith(searchStatus: FormzStatus.submissionFailure);
    }
  }

  Stream<SearchMiniState> _mapSearchMiniMoreToState() async* {
    if (_propertyRepository.searchPagination != null) {
      if (_propertyRepository.searchPagination!.pageNumber <
          _propertyRepository.searchPagination!.size - 1) {
        if (await InternetConnectionChecker().hasConnection) {
          yield state.copyWith(moreStatus: FormzStatus.submissionInProgress);
          try {
            List<RealProperty> list =
                await _propertyRepository.searchRealProperty(state.filter
                    .copyWith(pageNumber: state.filter.pageNumber + 1));
            yield state.copyWith(
                moreStatus: FormzStatus.submissionSuccess,
                properties: list,
                filter: state.filter.copyWith(
                  pageNumber: _propertyRepository.searchPagination!.pageNumber,
                ));
          } on DioError catch (e) {
            MyLogger.instance.log.e(e.message);
            yield state.copyWith(moreStatus: FormzStatus.submissionFailure);
          } catch (_) {
            MyLogger.instance.log.e(_.toString());
            yield state.copyWith(moreStatus: FormzStatus.submissionFailure);
          }
        }
      }
    }
  }

  Stream<SearchMiniState> _mapSortChangedToState(SortMiniChanged event) async* {
    var filter = state.filter.copyWith(
        sortBy: event.sortField.name, direction: event.direction.name);
    if (await InternetConnectionChecker().hasConnection && event.toSearch) {
      try {
        yield state.copyWith(updateStatus: FormzStatus.submissionInProgress);
        List<RealProperty> list =
            await _propertyRepository.searchRealProperty(filter);
        yield state.copyWith(
            updateStatus: FormzStatus.submissionSuccess,
            properties: list,
            filter: filter.copyWith(
                pageNumber: _propertyRepository.searchPagination!.pageNumber));
        return;
      } on DioError catch (e) {
        //TODO:
      } catch (e) {}
      yield state.copyWith(updateStatus: FormzStatus.submissionFailure);
    }
  }
}
