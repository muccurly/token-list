import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/entity/range.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';
import 'package:jurta_app/src/data/repository/i_address_repository.dart';
import 'package:jurta_app/src/data/repository/i_dictionary_repository.dart';
import 'package:jurta_app/src/data/repository/i_property_repository.dart';
import 'package:jurta_app/src/utils/my_logger.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required IAddressRepository addressRepository,
    required IDictionaryRepository dictionaryRepository,
    required IPropertyRepository propertyRepository,
  })  : _addressRepository = addressRepository,
        _dictionaryRepository = dictionaryRepository,
        _propertyRepository = propertyRepository,
        super(SearchState());

  final IAddressRepository _addressRepository;
  final IDictionaryRepository _dictionaryRepository;
  final IPropertyRepository _propertyRepository;

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is LoadCities)
      yield* _mapLoadCitiesToState();
    else if (event is LoadDistricts)
      yield* _mapLoadDistrictsToState(event);
    else if (event is CityChanged)
      yield* _mapCityChangedToState(event);
    else if (event is GetOrLoadObjectTypes)
      yield await _mapGetOrLoadObjectTypesToState();
    else if (event is SearchObjectTypeChoose)
      yield state.copyWith(
        filter: state.filter.copyWith(objectTypeId: event.type.id),
      );
    else if (event is SearchRoomsPressed)
      yield _mapRoomsPressedToState(event);
    else if (event is SearchMoreThan5Pressed)
      yield state.copyWith(
        filter: state.filter
            .copyWith(moreThanFiveRooms: !state.filter.moreThanFiveRooms),
      );
    else if (event is SearchPriceRangeChanged)
      yield state.copyWith(
          filter: state.filter
              .copyWith(priceRange: Range(from: event.from, to: event.to)));
    else if (event is SearchAreaRangeChanged)
      yield state.copyWith(
          filter: state.filter
              .copyWith(areaRange: Range(from: event.from, to: event.to)));
    else if (event is SearchReset)
      yield state.copyWith(
        filter: state.filter.copyWith(
          areaRange: const Range(),
          priceRange: const Range(),
          yearOfConstruction: const Range(),
          atelier: false,
          encumbrance: false,
          exchange: false,
          numberOfRooms: <int>[],
          moreThanFiveRooms: false,
        ),
      );
    else if(event is SearchProperties)
      yield* _mapSearchPropertiesToState();
  }

  Stream<SearchState> _mapLoadCitiesToState() async* {
    if (await InternetConnectionChecker().hasConnection) {
      yield state.copyWith(citiesStatus: FormzStatus.submissionInProgress);
      try {
        List<Address> list = await _addressRepository.findAllCities();
        yield state.copyWith(
            citiesStatus: FormzStatus.submissionSuccess, cities: list);
        return;
      } on DioError catch (e) {
        MyLogger.instance.log.e(e.message);
      } catch (_) {
        MyLogger.instance.log.e(_.toString());
      }
      yield state.copyWith(citiesStatus: FormzStatus.submissionFailure);
    }
  }

  Stream<SearchState> _mapLoadDistrictsToState(LoadDistricts event) async* {
    if (await InternetConnectionChecker().hasConnection) {
      yield state.copyWith(citiesStatus: FormzStatus.submissionInProgress);
      try {
        List<Address> list = await _addressRepository.findDistricts(event.code);
        yield state.copyWith(
            districtsStatus: FormzStatus.submissionSuccess, districts: list);
        return;
      } on DioError catch (e) {
        MyLogger.instance.log.e(e.message);
      } catch (_) {
        MyLogger.instance.log.e(_.toString());
      }
      yield state.copyWith(districtsStatus: FormzStatus.submissionFailure);
    }
  }

  Future<SearchState> _mapGetOrLoadObjectTypesToState() async {
    if (_dictionaryRepository.types.isEmpty) {
      MyLogger.instance.log.d('load object types');
      await _dictionaryRepository.findAllObjectTypes();
    } else {
      MyLogger.instance.log.d('object types already loaded');
    }
    return state.copyWith(objectTypes: _dictionaryRepository.types);
  }

  SearchState _mapRoomsPressedToState(SearchRoomsPressed event) {
    var list = <int>[];
    list.addAll(state.filter.numberOfRooms);
    if (list.contains(event.number))
      list.removeWhere((it) => it == event.number);
    else
      list.add(event.number);

    return state.copyWith(filter: state.filter.copyWith(numberOfRooms: list));
  }

  Stream<SearchState> _mapSearchPropertiesToState() async* {
    if (await InternetConnectionChecker().hasConnection) {
      yield state.copyWith(searchStatus: FormzStatus.submissionInProgress);
      try {
        List<RealProperty> props =
            await _propertyRepository.searchRealProperty(state.filter);
        yield state.copyWith(
            properties: props, searchStatus: FormzStatus.submissionSuccess);
        return;
      } on DioError catch (e) {
        MyLogger.instance.log.e(e.message);
      }
      catch (_) {
        MyLogger.instance.log.e(_.toString());
      }
      yield state.copyWith(searchStatus: FormzStatus.submissionFailure);
    }
  }

  Stream<SearchState> _mapCityChangedToState(CityChanged event) async*{
    yield state.copyWith(cityCode: event.cityCode);
    if(await InternetConnectionChecker().hasConnection){
      try{
        yield state.copyWith(districtsStatus: FormzStatus.submissionInProgress);
        List<Address> list = await _addressRepository.findDistricts(event.cityCode);
        yield state.copyWith(districtsStatus: FormzStatus.submissionSuccess,
            districts: list);
      }on DioError catch(e){
        MyLogger.instance.log.e(e.message);
        yield state.copyWith(searchStatus: FormzStatus.submissionFailure);
      }catch(_){
        MyLogger.instance.log.e(_.toString());
        yield state.copyWith(searchStatus: FormzStatus.submissionFailure);
      }
    }
  }


}
