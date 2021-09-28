part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<Property> properties;
  final RealPropertyFilter filter;
  final FormzStatus status;
  final FormzStatus callStatus;
  final bool firstLoading;
  final String? message;
  final String? phoneNumber;
  final List<DictionaryMultiLangItem>? objectTypes;

  const HomeState({
    this.properties = const <Property>[],
    required this.filter,
    this.status = FormzStatus.pure,
    this.callStatus = FormzStatus.pure,
    this.firstLoading = false,
    this.message,
    this.phoneNumber,
    this.objectTypes,
  });

  HomeState copyWith({
    List<Property>? properties,
    RealPropertyFilter? filter,
    FormzStatus? status,
    FormzStatus? callStatus,
    bool? firstLoading,
    String? message,
    String? phoneNumber,
    List<DictionaryMultiLangItem>? objectTypes,
  }) {
    return HomeState(
      properties: properties ?? this.properties,
      filter: filter ?? this.filter,
      status: status ?? this.status,
      callStatus: callStatus ?? this.callStatus,
      firstLoading: firstLoading ?? this.firstLoading,
      message: message ?? this.message,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      objectTypes: objectTypes ?? this.objectTypes,
    );
  }

  @override
  List<Object?> get props => [
        properties,
        filter,
        status,
        callStatus,
        firstLoading,
        message,
        phoneNumber,
        objectTypes,
      ];
}
