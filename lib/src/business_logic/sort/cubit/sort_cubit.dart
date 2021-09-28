import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurta_app/src/business_logic/sort/models/direction.dart';
import 'package:jurta_app/src/business_logic/sort/models/models.dart';
import 'package:jurta_app/src/business_logic/sort/sort.dart';

part 'sort_state.dart';

class SortCubit extends Cubit<SortState> {
  SortCubit() : super(SortState());

  void byDate({bool mini = false}) =>
      emit(SortState(sortField: SortField.DATE, direction: Direction.DESC,
          mini: mini));

  void byPriceDown({bool mini = false}) =>
      emit(SortState(sortField: SortField.PRICE, direction: Direction.DESC,
          mini: mini));

  void byPriceUp({bool mini = false}) =>
      emit(SortState(sortField: SortField.PRICE, direction: Direction.ASC,
      mini: mini));

  void byRoomsDown({bool mini = false}) =>
      emit(SortState(sortField: SortField.ROOMS, direction: Direction.DESC,
          mini: mini));

  void byRoomsUp({bool mini = false}) =>
      emit(SortState(sortField: SortField.ROOMS, direction: Direction.ASC,
          mini: mini));

  void byAreaDown({bool mini = false}) =>
      emit(SortState(sortField: SortField.AREA, direction: Direction.DESC,
          mini: mini));

  void byAreaUp({bool mini = false}) =>
      emit(SortState(sortField: SortField.AREA, direction: Direction.ASC,
          mini: mini));

  void reset() => emit(SortState(toSearch: false, mini: false));
}
