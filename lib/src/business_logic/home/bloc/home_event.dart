part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadProperties extends HomeEvent {
  const LoadProperties();
}

class LoadMoreProperties extends HomeEvent {
  const LoadMoreProperties();
}

class FilterChanged extends HomeEvent {
  final RealPropertyFilter filter;
  final List<DictionaryMultiLangItem>? objectTypes;

  const FilterChanged({required this.filter, this.objectTypes});

  @override
  List<Object?> get props => [filter, objectTypes];
}

class CallPressed extends HomeEvent {}

class LoadHouseClasses extends HomeEvent {}
