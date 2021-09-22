import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jurta_app/src/business_logic/sort/models/direction.dart';
import 'package:jurta_app/src/business_logic/sort/models/models.dart';
import 'package:jurta_app/src/business_logic/sort/sort.dart';

// part 'sort_event.dart';

part 'sort_state.dart';

class SortCubit extends Cubit<SortState> {
  SortCubit() : super(SortState());

  void byDate() => emit(
      state.copyWith(sortField: SortField.DATE, direction: Direction.DESC));

  void byPriceDown() =>
      emit(SortState(sortField: SortField.PRICE, direction: Direction.DESC));

  void byPriceUp() =>
      emit(SortState(sortField: SortField.PRICE, direction: Direction.ASC));

  void byRoomsDown() =>
      emit(SortState(sortField: SortField.ROOMS, direction: Direction.DESC));

  void byRoomsUp() =>
      emit(SortState(sortField: SortField.ROOMS, direction: Direction.ASC));

  void byAreaDown() =>
      emit(SortState(sortField: SortField.AREA, direction: Direction.DESC));

  void byAreaUp() =>
      emit(SortState(sortField: SortField.AREA, direction: Direction.ASC));
}
