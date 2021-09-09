part of 'home_bloc.dart';

class HomeState extends Equatable {
  final ApiResponse<RealProperty>? apiResponse;
  final List<RealProperty> properties;
  final RealPropertyFilter filter;
  final FormzStatus status;
  final String? message;

  HomeState({
    this.apiResponse,
    this.properties = const <RealProperty>[],
    //TODO: for check
    this.filter = const RealPropertyFilter(
      flagId: 3,
      numberOfRooms: <int>[1, 2, 3, 4],
      objectTypeId: 2,
    ),
    this.status = FormzStatus.pure,
    this.message,
  });

  HomeState copyWith({
    ApiResponse<RealProperty>? apiResponse,
    List<RealProperty>? properties,
    RealPropertyFilter? filter,
    FormzStatus? status,
    String? message,
  }) {
    return HomeState(
      apiResponse: apiResponse ?? this.apiResponse,
      properties: properties ?? this.properties,
      filter: filter ?? this.filter,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        apiResponse,
        properties,
        filter,
        status,
        message,
      ];
}
