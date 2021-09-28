import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jurta_app/src/business_logic/filter/filter.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/entity/property.dart';
import 'package:jurta_app/src/data/repository/i_property_repository.dart';
import 'package:jurta_app/src/data/repository/i_settings_repository.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required IPropertyRepository propertyRepository,
    required ISettingsRepository settingsRepository,
    required FilterBloc filterBloc,
  })  : _propertyRepository = propertyRepository,
        _settingsRepository = settingsRepository,
        super(HomeState(filter: filterBloc.state.filter)) {
    _filterStreamSubscription = filterBloc.stream.listen((filterState) => add(
        FilterChanged(
            filter: filterState.filter, objectTypes: filterState.objectTypes)));
  }

  final IPropertyRepository _propertyRepository;
  final ISettingsRepository _settingsRepository;

  late StreamSubscription<FilterState> _filterStreamSubscription;

  @override
  Future<void> close() {
    _filterStreamSubscription.cancel();
    return super.close();
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadProperties)
      yield* _mapLoadPropertiesToState(event);
    else if (event is LoadMoreProperties)
      yield* _mapLoadMorePropertiesToState(event);
    else if (event is FilterChanged)
      yield state.copyWith(
          filter: event.filter, objectTypes: event.objectTypes);
    else if (event is CallPressed) yield* _mapCallPressedToState();
  }

  Stream<HomeState> _mapCallPressedToState() async* {
    if (await InternetConnectionChecker().hasConnection) {
      yield state.copyWith(callStatus: FormzStatus.submissionInProgress);
      try {
        String phone = await _settingsRepository.getCallNumber();
        yield state.copyWith(
            callStatus: FormzStatus.submissionSuccess, phoneNumber: phone);
      } on DioError catch (e) {
        yield state.copyWith(
            callStatus: FormzStatus.submissionFailure, message: e.message);
      } catch (_) {
        MyLogger.instance.log.e(_.toString());
        yield state.copyWith(callStatus: FormzStatus.submissionFailure);
      }
    }
  }

  Stream<HomeState> _mapLoadPropertiesToState(
    LoadProperties event,
  ) async* {
    if (await InternetConnectionChecker().hasConnection) {
      yield state.copyWith(
          status: FormzStatus.submissionInProgress, firstLoading: true);
      try {
        print(state.filter.toString());
        List<Property> list = await _propertyRepository.findRealProperty(
            state.filter.copyWith(
                pageNumber: 0,
                flagId: state.filter.flagId,
                // objectTypeId: state.filter.objectTypeId
            ));
        yield state.copyWith(
          status: FormzStatus.submissionSuccess,
          properties: list,
          filter: state.filter.copyWith(
              pageNumber: _propertyRepository.mainPagination?.pageNumber,
              flagId: state.filter.flagId,
              // objectTypeId: state.filter.objectTypeId
          ),
          firstLoading: false,
        );
      } on DioError catch (e) {
        yield state.copyWith(
          status: FormzStatus.submissionFailure,
          message: e.message,
          firstLoading: false,
        );
      } catch (_) {
        MyLogger.instance.log.e(_.toString());
        yield state.copyWith(
          status: FormzStatus.submissionFailure,
          firstLoading: false,
        );
      }
    } else
      yield state.copyWith(
        status: FormzStatus.submissionFailure,
        message: 'Internet connection error',
        firstLoading: false,
      );
  }

  Stream<HomeState> _mapLoadMorePropertiesToState(
      LoadMoreProperties event) async* {
    if (_propertyRepository.mainPagination != null) {
      if (_propertyRepository.mainPagination!.pageNumber <
          _propertyRepository.mainPagination!.size - 1) {
        if (await InternetConnectionChecker().hasConnection) {
          yield state.copyWith(status: FormzStatus.submissionInProgress);
          try {
            List<Property> list = await _propertyRepository.findRealProperty(
                state.filter.copyWith(
                    pageNumber: state.filter.pageNumber + 1,
                    flagId: state.filter.flagId,
                    // objectTypeId: state.filter.objectTypeId
                ));
            yield state.copyWith(
              properties: list,
              status: FormzStatus.submissionSuccess,
              filter: state.filter.copyWith(
                  flagId: state.filter.flagId,
                  // objectTypeId: state.filter.objectTypeId,
                  pageNumber: _propertyRepository.mainPagination!.pageNumber),
            );
          } on DioError catch (e) {
            yield state.copyWith(
              status: FormzStatus.submissionFailure,
              message: e.message,
            );
          } catch (_) {
            MyLogger.instance.log.e(_.toString());
            yield state.copyWith(status: FormzStatus.submissionFailure);
          }
        } else
          yield state.copyWith(
            status: FormzStatus.submissionFailure,
            message: 'Internet connection error',
          );
      }
    }
  }
}
