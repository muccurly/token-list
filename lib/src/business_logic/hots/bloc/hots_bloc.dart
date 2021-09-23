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

part 'hots_event.dart';

part 'hots_state.dart';

class HotsBloc extends Bloc<HotsEvent, HotsState> {
  HotsBloc({
    required IPropertyRepository propertyRepository,
  })  : _propertyRepository = propertyRepository,
        super(
          HotsState(
            filter: RealPropertyFilter().copyWith(
              flagId: 3,
              objectTypeId: null,
            ),
          ),
        );

  final IPropertyRepository _propertyRepository;

  @override
  Stream<HotsState> mapEventToState(HotsEvent event) async* {
    if (event is LoadHots)
      yield* _mapLoadHotsToState();
    else if (event is LoadHotsMore) yield* _mapLoadHotsMoreToState();
  }

  Stream<HotsState> _mapLoadHotsToState() async* {
    if (await InternetConnectionChecker().hasConnection) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        List<RealProperty> list =
            await _propertyRepository.findHots(state.filter);
        yield state.copyWith(
            status: FormzStatus.submissionSuccess,
            firstLoad: false,
            properties: list,
            pagination: _propertyRepository.hotsPagination,
            filter: state.filter.copyWith(
              flagId: state.filter.flagId,
              objectTypeId: null,
              pageNumber: _propertyRepository.hotsPagination!.pageNumber,
            ));
        return;
      } on DioError catch (e) {
        MyLogger.instance.log.e(e.message);
      } catch (e) {
        MyLogger.instance.log.e(e.toString());
      }
    }
    yield state.copyWith(
      status: FormzStatus.submissionFailure,
    );
  }

  Stream<HotsState> _mapLoadHotsMoreToState() async* {

    if (_propertyRepository.hotsPagination != null) {
      if (state.filter.pageNumber <
          _propertyRepository.hotsPagination!.size - 1) {
        if (await InternetConnectionChecker().hasConnection) {
          yield state.copyWith(status: FormzStatus.submissionInProgress);
          try {
            List<RealProperty> list =
                await _propertyRepository.findHots(state.filter.copyWith(
              flagId: state.filter.flagId,
              objectTypeId: null,
              pageNumber: state.filter.pageNumber + 1,
            ));
            yield state.copyWith(
              status: FormzStatus.submissionSuccess,
              properties: list,
              pagination: _propertyRepository.hotsPagination,
              filter: state.filter.copyWith(
                flagId: state.filter.flagId,
                objectTypeId: null,
                pageNumber: _propertyRepository.hotsPagination!.pageNumber,
              ),
            );
            return;
          } on DioError catch (e) {
            MyLogger.instance.log.e(e.message);
          } catch (e) {
            MyLogger.instance.log.e(e.toString());
          }
        }
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}
