import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jurta_app/src/data/entity/range.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/repository/i_dictionary_repository.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc({
    required IDictionaryRepository dictionaryRepository,
  })  : _dictionaryRepository = dictionaryRepository,
        super(FilterState());

  final IDictionaryRepository _dictionaryRepository;

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
            // objectTypeId: state.filter.objectTypeId
        ),
      );
    else if (event is NewPressed)
      yield state.copyWith(
        filter: state.filter.copyWith(
            flagId: state.filter.flagId,
            showNew: event.value,
            // objectTypeId: state.filter.objectTypeId
        ),
      );
    else if (event is RoomsPressed)
      yield _mapRoomsPressedToState(event);
    else if (event is MoreThan5Pressed)
      yield state.copyWith(
        filter: state.filter.copyWith(
            flagId: state.filter.flagId,
            moreThanFiveRooms: !state.filter.moreThanFiveRooms,
            // objectTypeId: state.filter.objectTypeId
        ),
      );
    else if (event is PriceRangeChanged) {
      print('${event.from} | ${event.to}');
      yield state.copyWith(
          filter: state.filter.copyWith(
              flagId: state.filter.flagId,
              // objectTypeId: state.filter.objectTypeId,
              priceRange: Range(from: event.from, to: event.to)));
    } else if (event is AreaRangeChanged)
      yield state.copyWith(
          filter: state.filter.copyWith(
              flagId: state.filter.flagId,
              // objectTypeId: state.filter.objectTypeId,
              areaRange: Range(from: event.from, to: event.to)));
    else if (event is ObjectTypeChose)
      yield state.copyWith(
          filter: state.filter.copyWith(
              flagId: state.filter.flagId,
              objectType: event.item
          ));
    else if(event is FilterReset)
      yield state.copyWith(
        filter: const RealPropertyFilter(),
      );
  }

  Stream<FilterState> _mapLoadObjectTypesEventToState() async* {
    if (await InternetConnectionChecker().hasConnection) {
      try {
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        var list = await _dictionaryRepository.findAllObjectTypes();
        yield state.copyWith(
            status: FormzStatus.submissionSuccess, objectTypes: list);
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
            // objectTypeId: state.filter.objectTypeId
        ));
  }
}
