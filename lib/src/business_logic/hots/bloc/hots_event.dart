part of 'hots_bloc.dart';

abstract class HotsEvent extends Equatable {
  const HotsEvent();

  @override
  List<Object?> get props => [];
}

class LoadHots extends HotsEvent {
  const LoadHots();
}

class LoadHotsMore extends HotsEvent {
  const LoadHotsMore();
}

