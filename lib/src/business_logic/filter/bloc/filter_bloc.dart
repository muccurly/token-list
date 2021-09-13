import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/data/repository/i_dictionary_repository.dart';

part 'filter_event.dart';

part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc({
    required IDictionaryRepository dictionaryRepository,
  })  : _dictionaryRepository = dictionaryRepository,
        super(FilterState()) {
    _objectTypesStreamSubscription = _dictionaryRepository.objectTypes
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
        filter: state.filter
            .copyWith(flagId: state.filter.flagId == null ? 3 : null),
      );
    else if (event is NewPressed)
      yield state.copyWith(
        filter: state.filter.copyWith(
            flagId: state.filter.flagId, showNew: !state.filter.showNew),
      );
    else if (event is Rooms1Pressed)
      yield state.copyWith(
        filter: state.filter.copyWith(
            flagId: state.filter.flagId,
            numberOfRooms: state.filter.numberOfRooms
              ?..removeWhere((it) => it == 1)),
      );
    else if (event is Rooms2Pressed)
      yield state.copyWith(
        filter: state.filter.copyWith(
            flagId: state.filter.flagId,
            numberOfRooms: state.filter.numberOfRooms
              ?..removeWhere((it) => it == 2)),
      );
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
        yield state.copyWith(
            message: _.toString(), status: FormzStatus.submissionFailure);
      }
    } else
      yield state.copyWith(
          message: 'Internet connection error',
          status: FormzStatus.submissionFailure);
  }

  @override
  Future<void> close() {
    _objectTypesStreamSubscription.cancel();
    _dictionaryRepository.dispose();
    return super.close();
  }
}
