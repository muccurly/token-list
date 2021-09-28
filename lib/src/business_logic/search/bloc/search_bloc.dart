import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jurta_app/src/business_logic/sort/models/models.dart';
import 'package:jurta_app/src/business_logic/sort/sort.dart';
import 'package:jurta_app/src/data/entity/range.dart';
import 'package:jurta_app/src/data/entity/search_filter.dart';
import 'package:jurta_app/src/data/entity/address.dart';
import 'package:jurta_app/src/data/entity/dictionary_multi_lang_item.dart';
import 'package:jurta_app/src/data/entity/property.dart';
import 'package:jurta_app/src/data/entity/residential_complex.dart';
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
    required SortCubit sortCubit,
  })  : _addressRepository = addressRepository,
        _dictionaryRepository = dictionaryRepository,
        _propertyRepository = propertyRepository,
        _sortCubit = sortCubit,
        super(SearchState()) {
    _sortStreamSubscription =
        _sortCubit.stream.listen((event) => add(SortChanged(
              direction: event.direction,
              sortField: event.sortField,
              toSearch: event.toSearch,
              mini: event.mini,
            )));
  }

  final IAddressRepository _addressRepository;
  final IDictionaryRepository _dictionaryRepository;
  final IPropertyRepository _propertyRepository;
  final SortCubit _sortCubit;

  late StreamSubscription<SortState> _sortStreamSubscription;

  @override
  Future<void> close() {
    _sortStreamSubscription.cancel();
    return super.close();
  }

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
        filter: state.filter.copyWith(
          addressCode: state.filter.addressCode,
          atelier: state.filter.atelier,
          encumbrance: state.filter.encumbrance,
          exchange: state.filter.exchange,
          probabilityOfBidding: state.filter.probabilityOfBidding,
          objectType: event.type,
        ),
      );
    else if (event is SearchRoomsPressed)
      yield _mapRoomsPressedToState(event);
    else if (event is SearchMoreThan5Pressed)
      yield state.copyWith(
        filter: state.filter.copyWith(
          addressCode: state.filter.addressCode,
          atelier: state.filter.atelier,
          encumbrance: state.filter.encumbrance,
          exchange: state.filter.exchange,
          probabilityOfBidding: state.filter.probabilityOfBidding,
          moreThanFiveRooms: !state.filter.moreThanFiveRooms,
        ),
      );
    else if (event is SearchPriceRangeChanged)
      yield state.copyWith(
        filter: state.filter.copyWith(
          addressCode: state.filter.addressCode,
          atelier: state.filter.atelier,
          encumbrance: state.filter.encumbrance,
          exchange: state.filter.exchange,
          probabilityOfBidding: state.filter.probabilityOfBidding,
          priceRange: Range(from: event.from, to: event.to),
        ),
      );
    else if (event is SearchAreaRangeChanged)
      yield state.copyWith(
        filter: state.filter.copyWith(
          addressCode: state.filter.addressCode,
          atelier: state.filter.atelier,
          encumbrance: state.filter.encumbrance,
          exchange: state.filter.exchange,
          probabilityOfBidding: state.filter.probabilityOfBidding,
          areaRange: Range(from: event.from, to: event.to),
        ),
      );
    else if (event is SearchReset)
      yield state.copyWith(
        filter: state.filter.copyWith(
          areaRange: const Range(),
          priceRange: const Range(),
          yearOfConstruction: const Range(),
          atelier: null,
          numberOfRooms: <int>[],
          moreThanFiveRooms: false,
          probabilityOfBidding: null,
          encumbrance: null,
          exchange: null,
          // housingConditionId: null,
          housingCondition: DictionaryMultiLangItem.emptyE,
          houseClassId: null,
          objectType: DictionaryMultiLangItem.empty,
          addressCode: null,
          complex: ResidentialComplex.empty,
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
        filter: state.filter.copyWith(
          addressCode: state.filter.addressCode,
          atelier: state.filter.atelier,
          encumbrance: state.filter.encumbrance,
          exchange: state.filter.exchange,
          probabilityOfBidding: state.filter.probabilityOfBidding,
          complex: event.complex,
        ),
      );
    else if (event is AtelierChanged)
      yield state.copyWith(
        filter: state.filter.copyWith(
          addressCode: state.filter.addressCode,
          atelier: event.atelier,
          encumbrance: state.filter.encumbrance,
          exchange: state.filter.exchange,
          probabilityOfBidding: state.filter.probabilityOfBidding,
        ),
      );
    else if (event is LoadConditions)
      yield* _mapLoadHousingConditionsToState();
    else if (event is ConditionChoose)
      yield state.copyWith(
        filter: state.filter.copyWith(
          addressCode: state.filter.addressCode,
          atelier: state.filter.atelier,
          encumbrance: state.filter.encumbrance,
          exchange: state.filter.exchange,
          probabilityOfBidding: state.filter.probabilityOfBidding,
          housingCondition: event.type,
        ),
      );
    else if (event is YearsRangeChanged)
      yield state.copyWith(
        filter: state.filter.copyWith(
          addressCode: state.filter.addressCode,
          atelier: state.filter.atelier,
          encumbrance: state.filter.encumbrance,
          exchange: state.filter.exchange,
          probabilityOfBidding: state.filter.probabilityOfBidding,
          yearOfConstruction: Range(from: event.from, to: event.to),
        ),
      );
    else if (event is BiddingChanged)
      yield state.copyWith(
          filter: state.filter.copyWith(
              addressCode: state.filter.addressCode,
              atelier: state.filter.atelier,
              encumbrance: state.filter.encumbrance,
              exchange: state.filter.exchange,
              probabilityOfBidding: state.filter.probabilityOfBidding != null
                  ? !state.filter.probabilityOfBidding!
                  : true));
    else if (event is EncumbranceChanged)
      yield state.copyWith(
          filter: state.filter.copyWith(
              addressCode: state.filter.addressCode,
              atelier: state.filter.atelier,
              exchange: state.filter.exchange,
              probabilityOfBidding: state.filter.probabilityOfBidding,
              encumbrance: state.filter.encumbrance != null
                  ? !state.filter.encumbrance!
                  : true));
    else if (event is ExchangeChanged)
      yield state.copyWith(
          filter: state.filter.copyWith(
              addressCode: state.filter.addressCode,
              atelier: state.filter.atelier,
              encumbrance: state.filter.encumbrance,
              probabilityOfBidding: state.filter.probabilityOfBidding,
              exchange: state.filter.exchange != null
                  ? !state.filter.exchange!
                  : true));
    else if (event is SearchMore)
      yield* _mapSearchMoreToState();
    else if (event is SortChanged) yield* _mapSortChangedToState(event);
  }

  Stream<SearchState> _mapSortChangedToState(SortChanged event) async* {
    var filter = state.filter.copyWith(
      addressCode: state.filter.addressCode,
      atelier: state.filter.atelier,
      encumbrance: state.filter.encumbrance,
      exchange: state.filter.exchange,
      probabilityOfBidding: state.filter.probabilityOfBidding,
      sortBy: event.sortField.name,
      direction: event.direction.name,
    );
    if (await InternetConnectionChecker().hasConnection &&
        event.toSearch &&
        !event.mini) {
      try {
        yield state.copyWith(updateStatus: FormzStatus.submissionInProgress);
        List<Property> list =
            await _propertyRepository.searchRealProperty(filter);
        yield state.copyWith(
            updateStatus: FormzStatus.submissionSuccess,
            properties: list,
            filter: filter.copyWith(
                addressCode: state.filter.addressCode,
                atelier: state.filter.atelier,
                encumbrance: state.filter.encumbrance,
                exchange: state.filter.exchange,
                probabilityOfBidding: state.filter.probabilityOfBidding,
                pageNumber: _propertyRepository.searchPagination!.pageNumber));
        return;
      } on DioError catch (e) {
        //TODO:
      } catch (e) {}
      yield state.copyWith(updateStatus: FormzStatus.submissionFailure);
    }
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
        addressCode: state.filter.addressCode,
        atelier: state.filter.atelier,
        encumbrance: state.filter.encumbrance,
        exchange: state.filter.exchange,
        probabilityOfBidding: state.filter.probabilityOfBidding,
        numberOfRooms: list,
      ),
    );
  }

  Stream<SearchState> _mapSearchPropertiesToState() async* {
    if (await InternetConnectionChecker().hasConnection) {
      yield state.copyWith(searchStatus: FormzStatus.submissionInProgress);
      try {
        List<Property> props = await _propertyRepository.searchRealProperty(
            state.filter.copyWith(
                addressCode: state.filter.addressCode,
                atelier: state.filter.atelier,
                encumbrance: state.filter.encumbrance,
                exchange: state.filter.exchange,
                probabilityOfBidding: state.filter.probabilityOfBidding,
                pageNumber: 0));

        yield state.copyWith(
          properties: props,
          searchStatus: FormzStatus.submissionSuccess,
          filter: state.filter.copyWith(
            addressCode: state.filter.addressCode,
            atelier: state.filter.atelier,
            encumbrance: state.filter.encumbrance,
            exchange: state.filter.exchange,
            probabilityOfBidding: state.filter.probabilityOfBidding,
            pageNumber: _propertyRepository.searchPagination!.pageNumber,
          ),
        );
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
    yield state.copyWith(
      city: event.city,
      filter: state.filter.copyWith(
        addressCode: event.city.address?.addressObject.code,
        atelier: state.filter.atelier,
        encumbrance: state.filter.encumbrance,
        exchange: state.filter.exchange,
        probabilityOfBidding: state.filter.probabilityOfBidding,
      ),
    );
    if (event.city.address?.addressObject.code != null) {
      if (await InternetConnectionChecker().hasConnection) {
        try {
          yield state.copyWith(
              districtsStatus: FormzStatus.submissionInProgress);
          List<Address> list = await _addressRepository
              .findDistricts(event.city.address!.addressObject.code!);
          yield state.copyWith(
              districtsStatus: FormzStatus.submissionSuccess, districts: list);
        } on DioError catch (e) {
          MyLogger.instance.log.e(e.message);
          yield state.copyWith(districtsStatus: FormzStatus.submissionFailure);
        } catch (_) {
          MyLogger.instance.log.e(_.toString());
          yield state.copyWith(districtsStatus: FormzStatus.submissionFailure);
        }
      }
    }
  }

  Stream<SearchState> _mapDistrictChangedToState(DistrictChanged event) async* {
    yield state.copyWith(
      district: event.district,
      filter: state.filter.copyWith(
        addressCode: event.district.address?.addressObject.code,
        atelier: state.filter.atelier,
        encumbrance: state.filter.encumbrance,
        exchange: state.filter.exchange,
        probabilityOfBidding: state.filter.probabilityOfBidding,
      ),
    );
    var code = event.district.address?.addressObject.code;
    if (code != null && await InternetConnectionChecker().hasConnection) {
      try {
        yield state.copyWith(
          streetsStatus: FormzStatus.submissionInProgress,
          complexStatus: FormzStatus.submissionInProgress,
        );
        List<Address> list =
            await _addressRepository.findStreetsByParent(code);
        List<ResidentialComplex> lr =
            await _addressRepository.findResidentialComplex(code);
        yield state.copyWith(
          streetsStatus: FormzStatus.submissionSuccess,
          complexStatus: FormzStatus.submissionSuccess,
          streets: list,
          complexes: lr,
        );
      } on DioError catch (e) {
        MyLogger.instance.log.e(e.message);
        yield state.copyWith(
          streetsStatus: FormzStatus.submissionFailure,
          complexStatus: FormzStatus.submissionFailure,
        );
      } catch (_) {
        MyLogger.instance.log.e(_.toString());
        yield state.copyWith(
          streetsStatus: FormzStatus.submissionFailure,
          complexStatus: FormzStatus.submissionFailure,
        );
      }
    }
  }

  Stream<SearchState> _mapStreetChangedToState(StreetChanged event) async* {
    // yield state.copyWith(street: event.street);
    // if (event.street.address?.addressObject.code != null &&
    //     await InternetConnectionChecker().hasConnection) {
    //   try {
    //     yield state.copyWith(complexStatus: FormzStatus.submissionInProgress);
    //
    //     // yield state.copyWith(
    //     //     complexStatus: FormzStatus.submissionSuccess, complexes: list);
    //   } on DioError catch (e) {
    //     MyLogger.instance.log.e(e.message);
    //     yield state.copyWith(complexStatus: FormzStatus.submissionFailure);
    //   } catch (_) {
    //     MyLogger.instance.log.e(_.toString());
    //     yield state.copyWith(complexStatus: FormzStatus.submissionFailure);
    //   }
    // }
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
            List<Property> list = await _propertyRepository.searchRealProperty(
                state.filter.copyWith(
                    addressCode: state.filter.addressCode,
                    atelier: state.filter.atelier,
                    encumbrance: state.filter.encumbrance,
                    exchange: state.filter.exchange,
                    probabilityOfBidding: state.filter.probabilityOfBidding,
                    pageNumber: state.filter.pageNumber + 1));
            yield state.copyWith(
              moreStatus: FormzStatus.submissionSuccess,
              properties: list,
              filter: state.filter.copyWith(
                addressCode: state.filter.addressCode,
                atelier: state.filter.atelier,
                encumbrance: state.filter.encumbrance,
                exchange: state.filter.exchange,
                probabilityOfBidding: state.filter.probabilityOfBidding,
                pageNumber: _propertyRepository.searchPagination!.pageNumber,
              ),
            );
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
