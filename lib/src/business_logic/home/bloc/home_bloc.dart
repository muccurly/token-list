import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
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
  })  : _propertyRepository = propertyRepository,
        super(HomeState()) {
    _propertiesStreamSubscription = _propertyRepository.property
        .listen((apiResponse) => add(PropertiesLoaded(apiResponse)));
  }

  final IPropertyRepository _propertyRepository;
  late StreamSubscription<ApiResponse<RealProperty>>
      _propertiesStreamSubscription;

  var l = <RealProperty>[];
  var s = Set<RealProperty>();

  @override
  Future<void> close() {
    _propertiesStreamSubscription.cancel();
    _propertyRepository.dispose();
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
          properties: List<RealProperty>.from(
              s..addAll(event.apiResponse.data.data.data)));
    }
  }

  Stream<HomeState> _mapLoadPropertiesToState(
    LoadProperties event,
  ) async* {
    if (await InternetConnectionChecker().hasConnection) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        await _propertyRepository.findRealProperty(state.filter);
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
