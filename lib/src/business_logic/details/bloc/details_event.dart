part of 'details_bloc.dart';

abstract class DetailsEvent extends Equatable {
  const DetailsEvent();

  @override
  List<Object?> get props => [];
}


class DetailsLoad extends DetailsEvent {
  final int appId;

  const DetailsLoad(this.appId);

  @override
  List<Object?> get props => [appId];
}

class DetailsCall extends DetailsEvent {}

class DetailsLoadSame extends DetailsEvent {}

class DetailsLoadSameMore extends DetailsEvent{}

