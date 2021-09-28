part of 'sort_cubit.dart';

class SortState extends Equatable {
  final Direction direction;
  final SortField sortField;
  final bool toSearch;
  final bool mini;

  const SortState({
    this.direction = Direction.DESC,
    this.sortField = SortField.ID,
    this.toSearch = true,
    this.mini = false,
  });

  SortState copyWith({
    Direction? direction,
    SortField? sortField,
    bool? toSearch,
    bool? mini,
  }) {
    return SortState(
      direction: direction ?? this.direction,
      sortField: sortField ?? this.sortField,
      toSearch: toSearch ?? this.toSearch,
      mini: mini ?? this.mini,
    );
  }

  @override
  List<Object?> get props => [direction, sortField, toSearch, mini];
}

