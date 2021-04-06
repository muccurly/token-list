import 'package:flutter/material.dart';
import 'package:jurta/utils/utils.dart';
import 'package:jurta/widgets/widgets.dart';

class DrawerWrapper extends StatelessWidget {
  final DrawerType type;

  const DrawerWrapper({Key key, @required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case DrawerType.filter:
        return FilterDrawer();
        break;
      case DrawerType.menu:
        return MenuDrawer();
        break;
      default:
        return FilterDrawer();
        break;
    }
  }
}
