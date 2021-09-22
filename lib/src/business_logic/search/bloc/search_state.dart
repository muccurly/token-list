part of 'search_bloc.dart';

class SearchState extends Equatable {
  final FormzStatus citiesStatus;
  final FormzStatus districtsStatus;
  final FormzStatus streetsStatus;
  final FormzStatus complexStatus;
  final FormzStatus searchStatus;
  final List<Address> districts;
  final List<Address> cities;
  final List<Address> streets;
  final List<AddressStreet> complexes;
  final List<DictionaryMultiLangItem> objectTypes;
  final SearchFilter filter;
  final String? cityCode;
  final List<RealProperty> properties;

  SearchState({
    this.citiesStatus = FormzStatus.pure,
    this.districtsStatus = FormzStatus.pure,
    this.streetsStatus = FormzStatus.pure,
    this.complexStatus = FormzStatus.pure,
    this.searchStatus = FormzStatus.pure,
    this.districts = const <Address>[],
    this.cities = const <Address>[],
    this.streets = const <Address>[],
    this.complexes = const <AddressStreet>[],
    this.objectTypes = const <DictionaryMultiLangItem>[],
    this.filter = const SearchFilter(),
    this.cityCode,
    this.properties = const <RealProperty>[],
  });

  SearchState copyWith({
    FormzStatus? citiesStatus,
    FormzStatus? districtsStatus,
    FormzStatus? streetsStatus,
    FormzStatus? complexStatus,
    FormzStatus? searchStatus,
    List<Address>? districts,
    List<Address>? cities,
    List<Address>? streets,
    List<AddressStreet>? complexes,
    List<DictionaryMultiLangItem>? objectTypes,
    SearchFilter? filter,
    String? cityCode,
    List<RealProperty>? properties,
  }) {
    return SearchState(
      citiesStatus: citiesStatus ?? this.citiesStatus,
      districtsStatus: districtsStatus ?? this.districtsStatus,
      streetsStatus: streetsStatus ?? this.streetsStatus,
      complexStatus: complexStatus ?? this.complexStatus,
      searchStatus: searchStatus ?? this.searchStatus,
      districts: districts ?? this.districts,
      cities: cities ?? this.cities,
      streets: streets ?? this.streets,
      complexes: complexes ?? this.complexes,
      objectTypes: objectTypes ?? this.objectTypes,
      filter: filter ?? this.filter,
      cityCode: cityCode ?? this.cityCode,
      properties: properties ?? this.properties,
    );
  }

  @override
  List<Object?> get props => [
        citiesStatus,
        districtsStatus,
        streetsStatus,
        complexStatus,
    searchStatus,
        districts,
        cities,
        streets,
        complexes,
        objectTypes,
        filter,
        cityCode,
    properties,
      ];
}
