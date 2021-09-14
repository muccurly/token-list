import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jurta_app/src/business_logic/filter/filter.dart';
import 'package:jurta_app/src/data/entity/api_response.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/data/entity/real_property_filter.dart';
import 'package:jurta_app/src/data/repository/i_property_repository.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required IPropertyRepository propertyRepository,
    required FilterBloc filterBloc,
  })  : _propertyRepository = propertyRepository,
        super(HomeState(filter: filterBloc.state.filter)) {
    _apiResponseStreamSubscription = _propertyRepository.apiResponseStream
        .listen((apiResponse) => add(PropertiesLoaded(apiResponse, null)));
    _propertiesStreamSubscription = _propertyRepository.propertiesStream
        .listen((list) => add(PropertiesLoaded(null, list)));
    _filterStreamSubscription = filterBloc.stream.listen(
      (filterState) => add(FilterChanged(filterState.filter)),
    );
  }

  final IPropertyRepository _propertyRepository;

  late StreamSubscription<ApiResponse<RealProperty>>
      _apiResponseStreamSubscription;

  late StreamSubscription<List<RealProperty>> _propertiesStreamSubscription;

  late StreamSubscription<FilterState> _filterStreamSubscription;

  @override
  Future<void> close() {
    _apiResponseStreamSubscription.cancel();
    _propertiesStreamSubscription.cancel();
    _propertyRepository.dispose();
    _filterStreamSubscription.cancel();
    return super.close();
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadProperties)
      yield* _mapLoadPropertiesToState(event);
    else if (event is PropertiesLoaded) {
      yield state.copyWith(
          status: FormzStatus.submissionSuccess,
          apiResponse: event.apiResponse,
          filter: state.filter.copyWith(
              pageNumber: event.apiResponse?.data.pageNumber,
              flagId: state.filter.flagId),
          properties: event.items);
    } else if (event is LoadMoreProperties) {
      if (state.apiResponse != null) {
        if (state.apiResponse!.data.pageNumber < state.apiResponse!.data.size)
          yield* _mapLoadMorePropertiesToState(event);
      }
    } else if (event is FilterChanged)
      yield state.copyWith(filter: event.filter);
  }

  Stream<HomeState> _mapLoadPropertiesToState(
    LoadProperties event,
  ) async* {
    if (await InternetConnectionChecker().hasConnection) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        await _propertyRepository.findRealProperty(
            state.filter.copyWith(pageNumber: 0, flagId: state.filter.flagId));
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

  Stream<HomeState> _mapLoadMorePropertiesToState(
      LoadMoreProperties event) async* {
    if (await InternetConnectionChecker().hasConnection) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        await _propertyRepository.findRealProperty(state.filter.copyWith(
            pageNumber: state.filter.pageNumber + 1,
            flagId: state.filter.flagId));
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
