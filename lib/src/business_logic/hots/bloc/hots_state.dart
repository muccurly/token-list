part of 'hots_bloc.dart';

class HotsState extends Equatable {
  final List<RealProperty> properties;
  final RealPropertyFilter filter;
  final FormzStatus status;
  final Pagination<RealProperty>? pagination;
  final bool firstLoad;

  const HotsState({
    this.properties = const <RealProperty>[],
    required this.filter,
    this.status = FormzStatus.pure,
    this.pagination,
    this.firstLoad = true,
  });

  HotsState copyWith({
    List<RealProperty>? properties,
    RealPropertyFilter? filter,
    FormzStatus? status,
    Pagination<RealProperty>? pagination,
    bool? firstLoad,
  }) {
    return HotsState(
      properties: properties ?? this.properties,
      filter: filter ?? this.filter,
      status: status ?? this.status,
      pagination: pagination ?? this.pagination,
      firstLoad: firstLoad ?? this.firstLoad,
    );
  }

  @override
  List<Object?> get props => [
        properties,
        filter,
        status,
        pagination,
        firstLoad,
      ];
}
