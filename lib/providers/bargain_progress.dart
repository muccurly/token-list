import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jurta/utils/utils.dart';

class BargainProgressProvider with ChangeNotifier {
  double _value = 0.0;
  bool _done = false;
  Timer _timer;

  BargainProgressProvider({bool reverse = false, double value = 0.0}) {
    if (reverse) {
      _value = value;
      _startTimerReverse();
    } else {
      _startTimer();
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      log('${timer.tick}');
      value = timer.tick.toDouble() / 100; // +0.01%
    });
  }

  void _startTimerReverse() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      log('${timer.tick}');
      valueReverse = _value - 1; // -1 sec
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  double get value => _value;
  bool get done => _done;

  set value(double val) {
    _value = val;
    if (_value == 1.0) {
      _done = true;
      _cancelTimer();
    }
    notifyListeners();
  }

  set valueReverse(double val) {
    _value = val;
    if (_value == 0.0) {
      _done = true;
      _cancelTimer();
    }
    notifyListeners();
  }
}
