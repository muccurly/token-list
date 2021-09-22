import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/entity/range.dart';
import 'package:jurta_app/src/data/entity/real_property.dart';
import 'package:jurta_app/src/data/entity/residential_complex.dart';
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
    else if (event is CityChanged)
      yield* _mapCityChangedToState(event);
    else if (event is GetOrLoadObjectTypes)
      yield await _mapGetOrLoadObjectTypesToState();
    else if (event is SearchObjectTypeChoose)
      yield state.copyWith(
          filter: state.filter.copyWith(objectTypeId: event.type.id));
    else if (event is SearchRoomsPressed)
      yield _mapRoomsPressedToState(event);
    else if (event is SearchMoreThan5Pressed)
      yield state.copyWith(
          filter: state.filter
              .copyWith(moreThanFiveRooms: !state.filter.moreThanFiveRooms));
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
          numberOfRooms: <int>[],
          moreThanFiveRooms: false,
          probabilityOfBidding: null,
          encumbrance: null,
          exchange: null,
          housingConditionId: null,
          houseClassId: null,
        ),
      );
    else if (event is SearchProperties)
      yield* _mapSearchPropertiesToState();
    else if (event is DistrictChanged)
      yield* _mapDistrictChangedToState(event);
    else if (event is StreetChanged)
      yield* _mapStreetChangedToState(event);
    else if (event is ComplexChanged)
      yield state.copyWith(
          filter: state.filter.copyWith(residentialComplexId: event.complexId));
    else if (event is AtelierChanged)
      yield state.copyWith(
          filter: state.filter.copyWith(atelier: event.atelier));
    else if (event is LoadConditions)
      yield* _mapLoadHousingConditionsToState();
    else if (event is ConditionChoose)
      yield state.copyWith(
          filter: state.filter.copyWith(housingConditionId: event.type.id));
    else if (event is YearsRangeChanged)
      yield state.copyWith(
          filter: state.filter.copyWith(
              yearOfConstruction: Range(from: event.from, to: event.to)));
    else if (event is BiddingChanged)
      yield state.copyWith(
          filter: state.filter.copyWith(
              probabilityOfBidding: state.filter.probabilityOfBidding != null
                  ? !state.filter.probabilityOfBidding!
                  : null));
    else if (event is EncumbranceChanged)
      yield state.copyWith(
          filter: state.filter.copyWith(
              encumbrance: state.filter.encumbrance != null
                  ? !state.filter.encumbrance!
                  : null));
    else if (event is ExchangeChanged)
      yield state.copyWith(
          filter: state.filter.copyWith(
              exchange: state.filter.exchange != null
                  ? !state.filter.exchange!
                  : null));
    else if (event is SearchMore) yield* _mapSearchMoreToState();
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

  Future<SearchState> _mapGetOrLoadObjectTypesToState() async {
    if (_dictionaryRepository.types.isEmpty)
      await _dictionaryRepository.findAllObjectTypes();
    return state.copyWith(objectTypes: _dictionaryRepository.types);
  }

  SearchState _mapRoomsPressedToState(SearchRoomsPressed event) {
    var list = <int>[];
    list.addAll(state.filter.numberOfRooms);
    if (list.contains(event.number))
      list.removeWhere((it) => it == event.number);
    else
      list.add(event.number);

    return state.copyWith(
        filter: state.filter.copyWith(
      numberOfRooms: list,
    ));
  }

  Stream<SearchState> _mapSearchPropertiesToState() async* {
    if (await InternetConnectionChecker().hasConnection) {
      yield state.copyWith(searchStatus: FormzStatus.submissionInProgress);
      try {
        List<RealProperty> props = await _propertyRepository
            .searchRealProperty(state.filter.copyWith(pageNumber: 0));
        yield state.copyWith(
            properties: props, searchStatus: FormzStatus.submissionSuccess,
        filter: state.filter.copyWith(pageNumber: _propertyRepository.searchPagination!.pageNumber));
        return;
      } on DioError catch (e) {
        MyLogger.instance.log.e(e.message);
      } catch (_) {
        MyLogger.instance.log.e(_.toString());
      }
      yield state.copyWith(searchStatus: FormzStatus.submissionFailure);
    }
  }

  Stream<SearchState> _mapCityChangedToState(CityChanged event) async* {
    yield state.copyWith(cityCode: event.cityCode);
    if (await InternetConnectionChecker().hasConnection) {
      try {
        yield state.copyWith(citiesStatus: FormzStatus.submissionInProgress);
        List<Address> list =
            await _addressRepository.findDistricts(event.cityCode);
        yield state.copyWith(
            citiesStatus: FormzStatus.submissionSuccess, districts: list);
      } on DioError catch (e) {
        MyLogger.instance.log.e(e.message);
        yield state.copyWith(citiesStatus: FormzStatus.submissionFailure);
      } catch (_) {
        MyLogger.instance.log.e(_.toString());
        yield state.copyWith(citiesStatus: FormzStatus.submissionFailure);
      }
    }
  }

  Stream<SearchState> _mapDistrictChangedToState(DistrictChanged event) async* {
    yield state.copyWith(
        districtCode: event.districtCode,
        filter: state.filter.copyWith(addressCode: event.districtCode));
    if (await InternetConnectionChecker().hasConnection) {
      try {
        yield state.copyWith(streetsStatus: FormzStatus.submissionInProgress);
        List<Address> list =
            await _addressRepository.findStreetsByParent(event.districtCode);
        yield state.copyWith(
            streetsStatus: FormzStatus.submissionSuccess, streets: list);
      } on DioError catch (e) {
        MyLogger.instance.log.e(e.message);
        yield state.copyWith(streetsStatus: FormzStatus.submissionFailure);
      } catch (_) {
        MyLogger.instance.log.e(_.toString());
        yield state.copyWith(streetsStatus: FormzStatus.submissionFailure);
      }
    }
  }

  Stream<SearchState> _mapStreetChangedToState(StreetChanged event) async* {
    yield state.copyWith(streetCode: event.streetCode);
    if (await InternetConnectionChecker().hasConnection) {
      try {
        yield state.copyWith(complexStatus: FormzStatus.submissionInProgress);
        List<ResidentialComplex> list =
            await _addressRepository.findResidentialComplex(event.streetCode);
        yield state.copyWith(
            complexStatus: FormzStatus.submissionSuccess, complexes: list);
      } on DioError catch (e) {
        MyLogger.instance.log.e(e.message);
        yield state.copyWith(complexStatus: FormzStatus.submissionFailure);
      } catch (_) {
        MyLogger.instance.log.e(_.toString());
        yield state.copyWith(complexStatus: FormzStatus.submissionFailure);
      }
    }
  }

  Stream<SearchState> _mapLoadHousingConditionsToState() async* {
    if (await InternetConnectionChecker().hasConnection) {
      try {
        yield state.copyWith(condStatus: FormzStatus.submissionInProgress);
        List<DictionaryMultiLangItem> list =
            await _dictionaryRepository.findAllHouseConditions();
        yield state.copyWith(
            condStatus: FormzStatus.submissionSuccess, conditions: list);
      } on DioError catch (e) {
        MyLogger.instance.log.e(e.message);
        yield state.copyWith(condStatus: FormzStatus.submissionFailure);
      } catch (_) {
        MyLogger.instance.log.e(_.toString());
        yield state.copyWith(condStatus: FormzStatus.submissionFailure);
      }
    }
  }

  Stream<SearchState> _mapSearchMoreToState() async* {
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
}
