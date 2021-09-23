import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jurta_app/src/business_logic/details/models/same_app_filter.dart';
import 'package:jurta_app/src/data/entity/application_client_view.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/data/entity/same_property.dart';
import 'package:jurta_app/src/data/repository/i_property_repository.dart';
import 'package:jurta_app/src/data/repository/i_settings_repository.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

part 'details_event.dart';

part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc({
    required RealProperty property,
    required IPropertyRepository propertyRepository,
    required ISettingsRepository settingsRepository,
  })  : _propertyRepository = propertyRepository,
        _settingsRepository = settingsRepository,
        super(
          DetailsState(apv: ApplicationClientView.fromRealProperty(property)),
        );

  final IPropertyRepository _propertyRepository;
  final ISettingsRepository _settingsRepository;

  @override
  Stream<DetailsState> mapEventToState(DetailsEvent event) async* {
    if (event is DetailsLoad)
      yield* _mapDetailsLoadToState(event);
    else if (event is DetailsLoadSame) yield* _mapLoadSameToState();
    else if(event is DetailsLoadSameMore) yield* _mapLoadMoreSameToState();
    else if(event is DetailsCall) yield* _mapCallPressedToState();
  }

  Stream<DetailsState> _mapCallPressedToState() async* {
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

  Stream<DetailsState> _mapLoadSameToState() async* {
    if (state.filter != null &&
        await InternetConnectionChecker().hasConnection) {
      try {
        MyLogger.instance.log.d('load same ${state.filter}');
        yield state.copyWith(sameLoadStatus: FormzStatus.submissionInProgress);
        List<SameProperty> list =
            await _propertyRepository.findSameApps(state.filter!);
        yield state.copyWith(
          sameLoadStatus: FormzStatus.submissionSuccess,
          sameProps: list,
          filter: state.filter?.copyWith(
              pageNumber: _propertyRepository.samePagination?.pageNumber),
        );
      } on DioError catch(e){

      }
      // catch (e) {
      //   MyLogger.instance.log.e(e.toString());
      //   yield state.copyWith(sameLoadStatus: FormzStatus.submissionFailure);
      // }
    }
  }

  Stream<DetailsState> _mapLoadMoreSameToState() async* {
    if (state.filter != null && _propertyRepository.samePagination != null) {
      if (state.filter!.pageNumber <
              _propertyRepository.samePagination!.pageNumber - 1 &&
          await InternetConnectionChecker().hasConnection) {
        try {
          yield state.copyWith(
              sameLoadStatus: FormzStatus.submissionInProgress);
          List<SameProperty> list =
              await _propertyRepository.findSameApps(state.filter!.copyWith(
            pageNumber: state.filter!.pageNumber + 1,
          ));
          yield state.copyWith(
            sameLoadStatus: FormzStatus.submissionSuccess,
            sameProps: list,
            filter: state.filter?.copyWith(
                pageNumber: _propertyRepository.samePagination?.pageNumber),
          );
        } catch (e) {
          MyLogger.instance.log.e(e.toString());
          yield state.copyWith(sameLoadStatus: FormzStatus.submissionFailure);
        }
      }
    }
  }

  Stream<DetailsState> _mapDetailsLoadToState(DetailsLoad event) async* {
    if (await InternetConnectionChecker().hasConnection) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        ApplicationClientView apv =
            await _propertyRepository.findAppClientView(event.appId);
        var filter =  SameAppFilter(
          sourceApplicationId: apv.sellDataDto.applicationId,
          districtCode: apv.realPropertyDTO.buildingDto.district?.addressObject.code,
          numberOfRooms: apv.realPropertyDTO.numberOfRooms,
          objectPrice: apv.sellDataDto.objectPrice.toInt(),
          objectTypeId: apv.objectTypeId,
        );
        add(DetailsLoadSame());
        yield state.copyWith(
          apv: apv,
          status: FormzStatus.submissionSuccess,
          filter: filter,
        );
        return;
      } on DioError catch (e) {
        MyLogger.instance.log.e(e.message);
        state.copyWith(
          status: FormzStatus.submissionFailure,
          message: e.message,
        );
      }
      // catch(_){
      //   MyLogger.instance.log.e(_.toString());
      // }
    }
  }
}
