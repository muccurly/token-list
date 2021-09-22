part of 'search_bloc.dart';

class SearchState extends Equatable {
  final FormzStatus citiesStatus;
  final FormzStatus districtsStatus;
  final FormzStatus streetsStatus;
  final FormzStatus complexStatus;
  final FormzStatus searchStatus;
<<<<<<< HEAD
  final List<Address> districts;
  final List<Address> cities;
  final List<Address> streets;
  final List<AddressStreet> complexes;
  final List<DictionaryMultiLangItem> objectTypes;
  final SearchFilter filter;
  final String? cityCode;
=======
  final FormzStatus moreStatus;
  final FormzStatus condStatus;
  final List<Address> districts;
  final List<Address> cities;
  final List<Address> streets;
  final List<ResidentialComplex> complexes;
  final List<DictionaryMultiLangItem> objectTypes;
  final List<DictionaryMultiLangItem> conditions;
  final SearchFilter filter;
  final String? cityCode;
  final String? districtCode;
  final String? streetCode;
  final String? complexCode;
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
  final List<RealProperty> properties;

  SearchState({
    this.citiesStatus = FormzStatus.pure,
    this.districtsStatus = FormzStatus.pure,
    this.streetsStatus = FormzStatus.pure,
    this.complexStatus = FormzStatus.pure,
    this.searchStatus = FormzStatus.pure,
<<<<<<< HEAD
    this.districts = const <Address>[],
    this.cities = const <Address>[],
    this.streets = const <Address>[],
    this.complexes = const <AddressStreet>[],
    this.objectTypes = const <DictionaryMultiLangItem>[],
    this.filter = const SearchFilter(),
    this.cityCode,
=======
    this.moreStatus = FormzStatus.pure,
    this.condStatus = FormzStatus.pure,
    this.districts = const <Address>[],
    this.cities = const <Address>[],
    this.streets = const <Address>[],
    this.complexes = const <ResidentialComplex>[],
    this.objectTypes = const <DictionaryMultiLangItem>[],
    this.conditions = const <DictionaryMultiLangItem>[],
    this.filter = const SearchFilter(),
    this.cityCode,
    this.districtCode,
    this.streetCode,
    this.complexCode,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
    this.properties = const <RealProperty>[],
  });

  SearchState copyWith({
    FormzStatus? citiesStatus,
    FormzStatus? districtsStatus,
    FormzStatus? streetsStatus,
    FormzStatus? complexStatus,
    FormzStatus? searchStatus,
<<<<<<< HEAD
    List<Address>? districts,
    List<Address>? cities,
    List<Address>? streets,
    List<AddressStreet>? complexes,
    List<DictionaryMultiLangItem>? objectTypes,
    SearchFilter? filter,
    String? cityCode,
=======
    FormzStatus? moreStatus,
    FormzStatus? condStatus,
    List<Address>? districts,
    List<Address>? cities,
    List<Address>? streets,
    List<ResidentialComplex>? complexes,
    List<DictionaryMultiLangItem>? objectTypes,
    List<DictionaryMultiLangItem>? conditions,
    SearchFilter? filter,
    String? cityCode,
    String? districtCode,
    String? streetCode,
    String? complexCode,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
    List<RealProperty>? properties,
  }) {
    return SearchState(
      citiesStatus: citiesStatus ?? this.citiesStatus,
      districtsStatus: districtsStatus ?? this.districtsStatus,
      streetsStatus: streetsStatus ?? this.streetsStatus,
      complexStatus: complexStatus ?? this.complexStatus,
      searchStatus: searchStatus ?? this.searchStatus,
<<<<<<< HEAD
=======
      moreStatus: moreStatus ?? this.moreStatus,
      condStatus: condStatus ?? this.condStatus,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
      districts: districts ?? this.districts,
      cities: cities ?? this.cities,
      streets: streets ?? this.streets,
      complexes: complexes ?? this.complexes,
      objectTypes: objectTypes ?? this.objectTypes,
<<<<<<< HEAD
      filter: filter ?? this.filter,
      cityCode: cityCode ?? this.cityCode,
=======
      conditions: conditions ?? this.conditions,
      filter: filter ?? this.filter,
      cityCode: cityCode ?? this.cityCode,
      streetCode: streetCode ?? this.streetCode,
      complexCode: complexCode ?? this.complexCode,
      districtCode: districtCode ?? this.districtCode,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
      properties: properties ?? this.properties,
    );
  }

  @override
  List<Object?> get props => [
        citiesStatus,
        districtsStatus,
        streetsStatus,
        complexStatus,
<<<<<<< HEAD
    searchStatus,
=======
        searchStatus,
        moreStatus,
        condStatus,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
        districts,
        cities,
        streets,
        complexes,
        objectTypes,
<<<<<<< HEAD
        filter,
        cityCode,
    properties,
=======
        conditions,
        filter,
        cityCode,
        streetCode,
        complexCode,
        districtCode,
        properties,
>>>>>>> 0136df3e30614d21f574fbda491cfd2c2b697e94
      ];
}
