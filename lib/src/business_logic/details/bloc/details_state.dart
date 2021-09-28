part of 'details_bloc.dart';

class DetailsState extends Equatable {
  final Property? property;
  final FormzStatus status;
  final FormzStatus callStatus;
  final FormzStatus sameLoadStatus;
  final FormzStatus detailsStatus;
  final String? message;
  final SameAppFilter? filter;
  final List<Property> sameProps;
  final String? phoneNumber;

  const DetailsState({
    this.property,
    this.status = FormzStatus.pure,
    this.callStatus = FormzStatus.pure,
    this.sameLoadStatus = FormzStatus.pure,
    this.detailsStatus = FormzStatus.pure,
    this.message,
    this.filter,
    this.phoneNumber,
    this.sameProps = const <Property>[],
  });

  DetailsState copyWith({
    Property? property,
    FormzStatus? status,
    FormzStatus? callStatus,
    FormzStatus? sameLoadStatus,
    FormzStatus? detailsStatus,
    String? message,
    SameAppFilter? filter,
    List<Property>? sameProps,
    String? phoneNumber,
  }) {
    return DetailsState(
      property: property ?? this.property,
      status: status ?? this.status,
      callStatus: callStatus ?? this.callStatus,
      sameLoadStatus: sameLoadStatus ?? this.sameLoadStatus,
      detailsStatus: detailsStatus ?? this.detailsStatus,
      message: message ?? this.message,
      filter: filter ?? this.filter,
      sameProps: sameProps ?? this.sameProps,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object?> get props => [
        property,
        status,
        callStatus,
        sameLoadStatus,
        detailsStatus,
        message,
        filter,
        sameProps,
        phoneNumber,
      ];
}
