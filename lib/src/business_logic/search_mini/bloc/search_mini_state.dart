part of 'search_mini_bloc.dart';

class SearchMiniState extends Equatable {
  final FormzStatus searchStatus;
  final FormzStatus moreStatus;
  final FormzStatus updateStatus;
  final List<DictionaryMultiLangItem> objectTypes;
  final SearchFilter filter;
  final List<RealProperty> properties;

  SearchMiniState({
    this.searchStatus = FormzStatus.pure,
    this.moreStatus = FormzStatus.pure,
    this.updateStatus = FormzStatus.pure,
    this.objectTypes = const <DictionaryMultiLangItem>[],
    this.filter = const SearchFilter(),
    this.properties = const <RealProperty>[],
  });

  SearchMiniState copyWith({
    FormzStatus? searchStatus,
    FormzStatus? moreStatus,
    FormzStatus? updateStatus,
    List<DictionaryMultiLangItem>? objectTypes,
    SearchFilter? filter,
    List<RealProperty>? properties,
  }) {
    return SearchMiniState(
      searchStatus: searchStatus ?? this.searchStatus,
      moreStatus: moreStatus ?? this.moreStatus,
      updateStatus: updateStatus ?? this.updateStatus,
      objectTypes: objectTypes ?? this.objectTypes,
      filter: filter ?? this.filter,
      properties: properties ?? this.properties,
    );
  }

  @override
  List<Object?> get props => [
        searchStatus,
        moreStatus,
        updateStatus,
        objectTypes,
        filter,
        properties,
      ];
}
