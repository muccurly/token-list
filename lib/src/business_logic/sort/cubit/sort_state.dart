part of 'sort_cubit.dart';

class SortState extends Equatable {
  final Direction direction;
  final SortField sortField;
  final bool toSearch;

  const SortState({
    this.direction = Direction.DESC,
    this.sortField = SortField.ID,
    this.toSearch = true,
  });

  SortState copyWith({
    Direction? direction,
    SortField? sortField,
    bool? toSearch,
  }) {
    return SortState(
      direction: direction ?? this.direction,
      sortField: sortField ?? this.sortField,
      toSearch: toSearch ?? this.toSearch,
    );
  }

  @override
  List<Object?> get props => [direction, sortField, toSearch];
}

