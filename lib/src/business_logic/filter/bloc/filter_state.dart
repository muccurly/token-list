part of 'filter_bloc.dart';

class FilterState extends Equatable {
  final RealPropertyFilter filter;
  final List<ObjectType>? objectTypes;
  final FormzStatus status;
  final String? message;

  const FilterState({
    this.filter = const RealPropertyFilter(),
    this.objectTypes,
    this.status = FormzStatus.pure,
    this.message,
  });

  FilterState copyWith({
    RealPropertyFilter? filter,
    List<ObjectType>? objectTypes,
    FormzStatus? status,
    String? message,
}){
    return FilterState(
      filter: filter ?? this.filter,
      objectTypes: objectTypes ?? this.objectTypes,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [filter, objectTypes, status, message];
}
