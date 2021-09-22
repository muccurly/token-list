part of 'hots_bloc.dart';

class HotsState extends Equatable {
  final List<RealProperty> properties;
  final RealPropertyFilter filter;
  final FormzStatus status;
  final Pagination<RealProperty>? pagination;

  const HotsState({
    this.properties = const <RealProperty>[],
    required this.filter,
    this.status = FormzStatus.pure,
    this.pagination,
  });

  HotsState copyWith({
    List<RealProperty>? properties,
    RealPropertyFilter? filter,
    FormzStatus? status,
    Pagination<RealProperty>? pagination,
  }) {
    return HotsState(
      properties: properties ?? this.properties,
      filter: filter ?? this.filter,
      status: status ?? this.status,
      pagination: pagination ?? this.pagination,
    );
  }

  @override
  List<Object?> get props => [
        properties,
        filter,
        status,
        pagination,
      ];
}
