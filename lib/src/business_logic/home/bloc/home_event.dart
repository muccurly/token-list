part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadProperties extends HomeEvent {
  const LoadProperties();
}

class PropertiesLoaded extends HomeEvent {
  final ApiResponse<RealProperty> apiResponse;

  const PropertiesLoaded(this.apiResponse);

  @override
  List<Object?> get props => [apiResponse];
}

class LoadMoreProperties extends HomeEvent{
  const LoadMoreProperties();
}