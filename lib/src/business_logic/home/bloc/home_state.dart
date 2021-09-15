part of 'home_bloc.dart';

class HomeState extends Equatable {
  final ApiResponse<RealProperty>? apiResponse;
  final List<RealProperty> properties;
  final RealPropertyFilter filter;
  final FormzStatus status;
  final FormzStatus callStatus;
  final bool firstLoading;
  final String? message;
  final String? phoneNumber;

  const HomeState({
    this.apiResponse,
    this.properties = const <RealProperty>[],
    required this.filter,
    this.status = FormzStatus.pure,
    this.callStatus = FormzStatus.pure,
    this.firstLoading = false,
    this.message,
    this.phoneNumber,
  });

  HomeState copyWith({
    ApiResponse<RealProperty>? apiResponse,
    List<RealProperty>? properties,
    RealPropertyFilter? filter,
    FormzStatus? status,
    FormzStatus? callStatus,
    bool? firstLoading,
    String? message,
    String? phoneNumber,
  }) {
    return HomeState(
      apiResponse: apiResponse ?? this.apiResponse,
      properties: properties ?? this.properties,
      filter: filter ?? this.filter,
      status: status ?? this.status,
      callStatus: callStatus ?? this.callStatus,
      firstLoading: firstLoading ?? this.firstLoading,
      message: message ?? this.message,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object?> get props => [
        apiResponse,
        properties,
        filter,
        status,
        callStatus,
        firstLoading,
        message,
        phoneNumber,
      ];
}
