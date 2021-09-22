part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object?> get props => [];
}

class HotPressed extends FilterEvent {
  final bool value;

  const HotPressed(this.value);

  @override
  List<Object?> get props => [value];
}

class NewPressed extends FilterEvent {
  final bool value;

  const NewPressed(this.value);

  @override
  List<Object?> get props => [value];
}

class ObjectTypeChose extends FilterEvent {
  final DictionaryMultiLangItem item;

  const ObjectTypeChose(this.item);

  @override
  List<Object?> get props => [item];
}

class ObjectTypesLoad extends FilterEvent {}

class ObjectTypesLoaded extends FilterEvent {
  final List<DictionaryMultiLangItem> items;

  const ObjectTypesLoaded(this.items);

  @override
  List<Object?> get props => [items];
}

class RoomsPressed extends FilterEvent {
  final int number;

  const RoomsPressed(this.number);

  @override
  List<Object?> get props => [number];
}

class MoreThan5Pressed extends FilterEvent {}

class PriceRangeChanged extends FilterEvent {
  final int? from;
  final int? to;

  const PriceRangeChanged(this.from, this.to);

  @override
  List<Object?> get props => [from, to];
}

class AreaRangeChanged extends FilterEvent {
  final int? from;
  final int? to;

  const AreaRangeChanged(this.from, this.to);

  @override
  List<Object?> get props => [from, to];
}