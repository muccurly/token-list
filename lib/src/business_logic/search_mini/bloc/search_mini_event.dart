part of 'search_mini_bloc.dart';

abstract class SearchMiniEvent extends Equatable {
  const SearchMiniEvent();

  @override
  List<Object?> get props => [];
}

class SearchMiniGetObjectTypes extends SearchMiniEvent {}

class SearchMiniObjectTypeChoose extends SearchMiniEvent {
  final DictionaryMultiLangItem type;

  const SearchMiniObjectTypeChoose(this.type);

  @override
  List<Object?> get props => [type];
}

class SearchMiniRoomsPressed extends SearchMiniEvent {
  final int number;

  const SearchMiniRoomsPressed(this.number);

  @override
  List<Object?> get props => [number];
}

class SearchMiniMoreThan5Pressed extends SearchMiniEvent {}

class SearchMiniPriceRangeChanged extends SearchMiniEvent {
  final int? from;
  final int? to;

  const SearchMiniPriceRangeChanged(this.from, this.to);

  @override
  List<Object?> get props => [from, to];
}

class SearchMiniAreaRangeChanged extends SearchMiniEvent {
  final int? from;
  final int? to;

  const SearchMiniAreaRangeChanged(this.from, this.to);

  @override
  List<Object?> get props => [from, to];
}

class SearchMiniReset extends SearchMiniEvent {}

class SearchMiniProperties extends SearchMiniEvent {}

class SearchMiniMore extends SearchMiniEvent {}

class SortMiniChanged extends SearchMiniEvent {
  final Direction direction;
  final SortField sortField;
  final bool toSearch;

  const SortMiniChanged({
    required this.direction,
    required this.sortField,
    required this.toSearch,
  });

  @override
  List<Object?> get props => [direction, sortField, toSearch];
}
