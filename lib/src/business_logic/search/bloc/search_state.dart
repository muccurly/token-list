part of 'search_bloc.dart';

class SearchState extends Equatable {
  final FormzStatus citiesStatus;
  final FormzStatus districtsStatus;
  final FormzStatus streetsStatus;
  final FormzStatus complexStatus;
  final FormzStatus searchStatus;
  final FormzStatus updateStatus;
  final FormzStatus moreStatus;
  final FormzStatus condStatus;
  final List<Address> districts;
  final List<Address> cities;
  final List<Address> streets;
  final List<ResidentialComplex> complexes;
  final List<DictionaryMultiLangItem> objectTypes;
  final List<DictionaryMultiLangItem> conditions;
  final SearchFilter filter;
  // final String? cityCode;
  // final String? districtCode;
  // final String? streetCode;
  // final String? complexCode;

  final Address? city;
  final Address? district;
  final Address? street;
  final ResidentialComplex? complex;

  final List<Property> properties;

  SearchState({
    this.citiesStatus = FormzStatus.pure,
    this.districtsStatus = FormzStatus.pure,
    this.streetsStatus = FormzStatus.pure,
    this.complexStatus = FormzStatus.pure,
    this.searchStatus = FormzStatus.pure,
    this.updateStatus = FormzStatus.pure,
    this.moreStatus = FormzStatus.pure,
    this.condStatus = FormzStatus.pure,
    this.districts = const <Address>[],
    this.cities = const <Address>[],
    this.streets = const <Address>[],
    this.complexes = const <ResidentialComplex>[],
    this.objectTypes = const <DictionaryMultiLangItem>[],
    this.conditions = const <DictionaryMultiLangItem>[],
    this.filter = const SearchFilter(),
    // this.cityCode,
    // this.districtCode,
    // this.streetCode,
    // this.complexCode,
    this.properties = const <Property>[],
    this.city,
    this.district,
    this.street,
    this.complex,
  });

  SearchState copyWith({
    FormzStatus? citiesStatus,
    FormzStatus? districtsStatus,
    FormzStatus? streetsStatus,
    FormzStatus? complexStatus,
    FormzStatus? searchStatus,
    FormzStatus? updateStatus,
    FormzStatus? moreStatus,
    FormzStatus? condStatus,
    List<Address>? districts,
    List<Address>? cities,
    List<Address>? streets,
    List<ResidentialComplex>? complexes,
    List<DictionaryMultiLangItem>? objectTypes,
    List<DictionaryMultiLangItem>? conditions,
    SearchFilter? filter,
    // String? cityCode,
    // String? districtCode,
    // String? streetCode,
    // String? complexCode,
    List<Property>? properties,
    Address? city,
    Address? district,
    Address? street,
    ResidentialComplex? complex,
  }) {
    return SearchState(
      citiesStatus: citiesStatus ?? this.citiesStatus,
      districtsStatus: districtsStatus ?? this.districtsStatus,
      streetsStatus: streetsStatus ?? this.streetsStatus,
      complexStatus: complexStatus ?? this.complexStatus,
      searchStatus: searchStatus ?? this.searchStatus,
      updateStatus: updateStatus ?? this.updateStatus,
      moreStatus: moreStatus ?? this.moreStatus,
      condStatus: condStatus ?? this.condStatus,
      districts: districts ?? this.districts,
      cities: cities ?? this.cities,
      streets: streets ?? this.streets,
      complexes: complexes ?? this.complexes,
      objectTypes: objectTypes ?? this.objectTypes,
      conditions: conditions ?? this.conditions,
      filter: filter ?? this.filter,
      // cityCode: cityCode ?? this.cityCode,
      // streetCode: streetCode ?? this.streetCode,
      // complexCode: complexCode ?? this.complexCode,
      // districtCode: districtCode ?? this.districtCode,
      properties: properties ?? this.properties,
      city: city ?? this.city,
      district: district ?? this.district,
      street: street ?? this.street,
      complex: complex ?? this.complex,
    );
  }

  @override
  List<Object?> get props => [
        citiesStatus,
        districtsStatus,
        streetsStatus,
        complexStatus,
        searchStatus,
        updateStatus,
        moreStatus,
        condStatus,
        districts,
        cities,
        streets,
        complexes,
        objectTypes,
        conditions,
        filter,
        // cityCode,
        // streetCode,
        // complexCode,
        // districtCode,
        properties,
        city,
        district,
        street,
        complex,
      ];
}
