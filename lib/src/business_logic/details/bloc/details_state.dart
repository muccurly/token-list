part of 'details_bloc.dart';

class DetailsState extends Equatable {
  final ApplicationClientView apv;
  final FormzStatus status;
  final FormzStatus callStatus;
  final FormzStatus sameLoadStatus;
  final String? message;
  final SameAppFilter? filter;
  final List<SameProperty> sameProps;
  final String? phoneNumber;

  const DetailsState({
    required this.apv,
    this.status = FormzStatus.pure,
    this.callStatus = FormzStatus.pure,
    this.sameLoadStatus = FormzStatus.pure,
    this.message,
    this.filter,
    this.phoneNumber,
    this.sameProps = const <SameProperty>[],
  });

  DetailsState copyWith({
    ApplicationClientView? apv,
    FormzStatus? status,
    FormzStatus? callStatus,
    FormzStatus? sameLoadStatus,
    String? message,
    SameAppFilter? filter,
    List<SameProperty>? sameProps,
    String? phoneNumber,
  }) {
    return DetailsState(
      apv: apv ?? this.apv,
      status: status ?? this.status,
      callStatus: callStatus ?? this.callStatus,
      sameLoadStatus: sameLoadStatus ?? this.sameLoadStatus,
      message: message ?? this.message,
      filter: filter ?? this.filter,
      sameProps: sameProps ?? this.sameProps,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object?> get props => [
        apv,
        status,
        callStatus,
        sameLoadStatus,
        message,
        filter,
        sameProps,
        phoneNumber,
      ];
}
