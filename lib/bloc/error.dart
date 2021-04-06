import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RealPropertyVideoTourErrorBloc {
  final BehaviorSubject<String> _subject = BehaviorSubject<String>();

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<String> get subject => _subject;
}

final blocErrorRealPropertyVideoTour = RealPropertyVideoTourErrorBloc();
