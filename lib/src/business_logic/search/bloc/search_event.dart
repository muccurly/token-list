part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class LoadCities extends SearchEvent {}

class LoadDistricts extends SearchEvent {
  final String code;

  const LoadDistricts({required this.code});

  @override
  List<Object?> get props => [code];
}

class LoadStreets extends SearchEvent {
  final String code;
  final String? text;

  const LoadStreets({required this.code, this.text});

  @override
  List<Object?> get props => [code, text];
}

class LoadResidentialComplex extends SearchEvent {
  final String? code, text;

  const LoadResidentialComplex({this.code, this.text});

  @override
  List<Object?> get props => [code, text];
}

class CityChanged extends SearchEvent {
  final String cityCode;

  const CityChanged(this.cityCode);

  @override
  List<Object?> get props => [cityCode];
}

class GetOrLoadObjectTypes extends SearchEvent {}

class SearchObjectTypeChoose extends SearchEvent {
  final DictionaryMultiLangItem type;

  const SearchObjectTypeChoose(this.type);

  @override
  List<Object?> get props => [type];
}

class SearchRoomsPressed extends SearchEvent {
  final int number;

  const SearchRoomsPressed(this.number);

  @override
  List<Object?> get props => [number];
}

class SearchMoreThan5Pressed extends SearchEvent {}

class SearchPriceRangeChanged extends SearchEvent {
  final int? from;
  final int? to;

  const SearchPriceRangeChanged(this.from, this.to);

  @override
  List<Object?> get props => [from, to];
}

class SearchAreaRangeChanged extends SearchEvent {
  final int? from;
  final int? to;

  const SearchAreaRangeChanged(this.from, this.to);

  @override
  List<Object?> get props => [from, to];
}

class SearchReset extends SearchEvent {}

class SearchProperties extends SearchEvent {}

class DistrictChanged extends SearchEvent {
  final String districtCode;

  const DistrictChanged(this.districtCode);

  @override
  List<Object?> get props => [districtCode];
}

class StreetChanged extends SearchEvent {
  final String streetCode;

  const StreetChanged(this.streetCode);

  @override
  List<Object?> get props => [streetCode];
}

class ComplexChanged extends SearchEvent {
  final int complexId;

  const ComplexChanged(this.complexId);

  @override
  List<Object?> get props => [complexId];
}

class AtelierChanged extends SearchEvent {
  final bool? atelier;

  const AtelierChanged(this.atelier);

  @override
  List<Object?> get props => [atelier];
}

class LoadConditions extends SearchEvent {}

class ConditionChoose extends SearchEvent {
  final DictionaryMultiLangItem type;

  const ConditionChoose(this.type);

  @override
  List<Object?> get props => [type];
}

class YearsRangeChanged extends SearchEvent {
  final int? from;
  final int? to;

  const YearsRangeChanged(this.from, this.to);

  @override
  List<Object?> get props => [from, to];
}

class ExchangeChanged extends SearchEvent {}

class EncumbranceChanged extends SearchEvent {}

class BiddingChanged extends SearchEvent {}

class SearchMore extends SearchEvent {}

class SortChanged extends SearchEvent {
  final Direction direction;
  final SortField sortField;
  final bool toSearch;

  const SortChanged({
    required this.direction,
    required this.sortField,
    required this.toSearch,
  });

  @override
  List<Object?> get props => [direction, sortField, toSearch];
}
