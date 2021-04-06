import 'package:flutter/material.dart';

class TabProvider with ChangeNotifier {
  bool _hideNavBar = false;
  bool get hideNavBar => _hideNavBar;
  set hideNavBar(bool value) {
    _hideNavBar = value;
    notifyListeners();
  }
}
