import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jurta_app/src/business_logic/filter/filter.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/entity/range.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/data/repository/i_dictionary_repository.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

part 'filter_event.dart';

part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc({
    required IDictionaryRepository dictionaryRepository,
  })  : _dictionaryRepository = dictionaryRepository,
        super(FilterState()) {
    _objectTypesStreamSubscription = dictionaryRepository.objectTypes
        .listen((items) => add(ObjectTypesLoaded(items)));
  }

  final IDictionaryRepository _dictionaryRepository;

  late StreamSubscription<List<DictionaryMultiLangItem>>
      _objectTypesStreamSubscription;

  @override
  Stream<FilterState> mapEventToState(FilterEvent event) async* {
    if (event is ObjectTypesLoad)
      yield* _mapLoadObjectTypesEventToState();
    else if (event is ObjectTypesLoaded)
      yield state.copyWith(
          status: FormzStatus.submissionSuccess, objectTypes: event.items);
    else if (event is HotPressed)
      yield state.copyWith(
        filter: state.filter.copyWith(
            flagId: event.value == true ? 3 : null,
            objectTypeId: state.filter.objectTypeId),
      );
    else if (event is NewPressed)
      yield state.copyWith(
        filter: state.filter.copyWith(
            flagId: state.filter.flagId,
            showNew: event.value,
            objectTypeId: state.filter.objectTypeId),
      );
    else if (event is RoomsPressed)
      yield _mapRoomsPressedToState(event);
    else if (event is MoreThan5Pressed)
      yield state.copyWith(
        filter: state.filter.copyWith(
            flagId: state.filter.flagId,
            moreThanFiveRooms: !state.filter.moreThanFiveRooms,
            objectTypeId: state.filter.objectTypeId),
      );
    else if (event is PriceRangeChanged)
      yield state.copyWith(
          filter: state.filter.copyWith(
              flagId: state.filter.flagId,
              objectTypeId: state.filter.objectTypeId,
              priceRange: Range(from: event.from, to: event.to)));
    else if (event is AreaRangeFromChanged)
      yield state.copyWith(
          filter: state.filter.copyWith(
              flagId: state.filter.flagId,
              objectTypeId: state.filter.objectTypeId,
              areaRange: state.filter.areaRange == null
                  ? Range(from: event.value)
                  : state.filter.areaRange!.copyWith(
                      from: event.value, to: state.filter.areaRange!.to)));
    else if (event is AreaRangeToChanged)
      yield state.copyWith(
          filter: state.filter.copyWith(
              flagId: state.filter.flagId,
              objectTypeId: state.filter.objectTypeId,
              areaRange: state.filter.areaRange == null
                  ? Range(to: event.value)
                  : state.filter.areaRange!.copyWith(
                      from: state.filter.areaRange!.from, to: event.value)));
    else if (event is ObjectTypeChose) {
      yield state.copyWith(
          filter: state.filter.copyWith(
              flagId: state.filter.flagId, objectTypeId: event.item.id));
    }
  }

  Stream<FilterState> _mapLoadObjectTypesEventToState() async* {
    if (await InternetConnectionChecker().hasConnection) {
      try {
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        await _dictionaryRepository.findAllObjectTypes();
      } on DioError catch (e) {
        yield state.copyWith(
            message: e.message, status: FormzStatus.submissionFailure);
      } catch (_) {
        MyLogger.instance.log.e(_.toString());
        yield state.copyWith(
            message: _.toString(), status: FormzStatus.submissionFailure);
      }
    } else
      yield state.copyWith(
          message: 'Internet connection error',
          status: FormzStatus.submissionFailure);
  }

  FilterState _mapRoomsPressedToState(RoomsPressed event) {
    var list = <int>[];
    if (state.filter.numberOfRooms != null) {
      list.addAll(state.filter.numberOfRooms!);
      if (list.contains(event.number))
        list.removeWhere((it) => it == event.number);
      else
        list.add(event.number);
    } else
      list.add(event.number);
    return state.copyWith(
        filter: state.filter.copyWith(
            flagId: state.filter.flagId,
            numberOfRooms: list,
            objectTypeId: state.filter.objectTypeId));
  }

  @override
  Future<void> close() {
    _objectTypesStreamSubscription.cancel();
    _dictionaryRepository.dispose();
    return super.close();
  }
}
