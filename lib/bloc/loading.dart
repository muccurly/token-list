import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RealPropertyVideoTourLoadingBloc {
  final BehaviorSubject<bool> _subject = BehaviorSubject<bool>();

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<bool> get subject => _subject;
}

final blocLoadingRealPropertyVideoTour = RealPropertyVideoTourLoadingBloc();
