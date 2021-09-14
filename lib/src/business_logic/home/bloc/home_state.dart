part of 'home_bloc.dart';

class HomeState extends Equatable {
  final ApiResponse<RealProperty>? apiResponse;
  final List<RealProperty> properties;
  final RealPropertyFilter filter;
  final FormzStatus status;
  final bool firstLoading;
  final String? message;

  const HomeState({
    this.apiResponse,
    this.properties = const <RealProperty>[],
    required this.filter,
    this.status = FormzStatus.pure,
    this.firstLoading = false,
    this.message,
  });

  HomeState copyWith({
    ApiResponse<RealProperty>? apiResponse,
    List<RealProperty>? properties,
    RealPropertyFilter? filter,
    FormzStatus? status,
    bool? firstLoading,
    String? message,
  }) {
    return HomeState(
        apiResponse: apiResponse ?? this.apiResponse,
        properties: properties ?? this.properties,
        filter: filter ?? this.filter,
        status: status ?? this.status,
        message: message ?? this.message,
        firstLoading: firstLoading ?? this.firstLoading);
  }

  @override
  List<Object?> get props => [
        apiResponse,
        properties,
        filter,
        status,
        firstLoading,
        message,
      ];
}
