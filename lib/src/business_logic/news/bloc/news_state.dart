part of 'news_bloc.dart';

class NewsState extends Equatable {
  final List<RealProperty> properties;
  final RealPropertyFilter filter;
  final FormzStatus status;
  final Pagination<RealProperty>? pagination;
  final bool firstLoad;

  const NewsState({
    this.properties = const <RealProperty>[],
    required this.filter,
    this.status = FormzStatus.pure,
    this.pagination,
    this.firstLoad = true,
  });

  NewsState copyWith({
    List<RealProperty>? properties,
    RealPropertyFilter? filter,
    FormzStatus? status,
    Pagination<RealProperty>? pagination,
    bool? firstLoad,
  }) {
    return NewsState(
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
