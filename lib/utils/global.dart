import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Global {
  static Size _kSize;
  static double _kPixelRatio;
  static PersistentTabController _controller;
  static BuildContext c;
  static Function rootSetState;
  static EdgeInsets _viewPadding;

  static dynamic getViewPadding(context) {
    _viewPadding = MediaQuery.of(context).viewPadding;
    return _viewPadding;
  }

  static Size getSize(context) {
    if (_kSize == null) _kSize = MediaQuery.of(context).size;
    return _kSize;
  }

  static double getPixelRatio(context) {
    if (_kPixelRatio == null)
      _kPixelRatio = MediaQuery.of(context).devicePixelRatio;
    return _kPixelRatio;
  }

  static PersistentTabController getController() => _controller;
  static PersistentTabController setController(
          PersistentTabController controller) =>
      _controller = controller;
  static void disposeTabController() => _controller.dispose();
}

onSelectNotification(String payload, context) {
  final _size = MediaQuery.of(Global.c).size;
  final data = json.decode(payload);
  var title;
  var body;
  if (data != null) {
    title = data['title'];
    body = data['body'];
  }

  showDialog(
    context: Global.c,
    barrierDismissible: false,
    useSafeArea: true,
    builder: (ctx) {
      return AlertDialog(
        title: Text(title ?? '--'),
        content: Container(
          constraints: BoxConstraints(
            minHeight: 1,
            maxHeight: _size.height / 1.5,
            minWidth: 1,
            maxWidth: _size.width,
          ),
          // height: _width / 2,
          width: _size.width,
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                body ?? '--',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: Text('Закрыть'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      );
    },
  );
  // Navigator.of(context).push(
  //   MaterialPageRoute(
  //     builder: (_) {
  //       return NewScreen(
  //         payload: payload,
  //       );
  //     },
  //   ),
  // );
}

class NewScreen extends StatelessWidget {
  final String payload;

  NewScreen({
    @required this.payload,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          payload ?? '',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
