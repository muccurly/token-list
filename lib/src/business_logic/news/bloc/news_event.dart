part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object?> get props => [];
}

class LoadNews extends NewsEvent {
  const LoadNews();
}

class LoadNewsMore extends NewsEvent {
  const LoadNewsMore();
}

