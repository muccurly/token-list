part of 'news_bloc.dart';

class NewsState extends Equatable {
  final List<Property> properties;
  final RealPropertyFilter filter;
  final FormzStatus status;
  final Pagination<Property>? pagination;
  final bool firstLoad;

  const NewsState({
    this.properties = const <Property>[],
    required this.filter,
    this.status = FormzStatus.pure,
    this.pagination,
    this.firstLoad = true,
  });

  NewsState copyWith({
    List<Property>? properties,
    RealPropertyFilter? filter,
    FormzStatus? status,
    Pagination<Property>? pagination,
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
