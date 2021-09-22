part of 'news_bloc.dart';

class NewsState extends Equatable {
  final List<RealProperty> properties;
  final RealPropertyFilter filter;
  final FormzStatus status;
  final Pagination<RealProperty>? pagination;

  const NewsState({
    this.properties = const <RealProperty>[],
    required this.filter,
    this.status = FormzStatus.pure,
    this.pagination,
  });

  NewsState copyWith({
    List<RealProperty>? properties,
    RealPropertyFilter? filter,
    FormzStatus? status,
    Pagination<RealProperty>? pagination,
  }) {
    return NewsState(
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
