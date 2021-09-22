part of 'sort_cubit.dart';

class SortState extends Equatable {
  final Direction direction;
  final SortField sortField;

  const SortState({
    this.direction = Direction.DESC,
    this.sortField = SortField.ID,
  });

  SortState copyWith({
    Direction? direction,
    SortField? sortField,
  }) {
    return SortState(
      direction: direction ?? this.direction,
      sortField: sortField ?? this.sortField,
    );
  }

  @override
  List<Object?> get props => [direction, sortField];
}

