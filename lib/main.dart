import 'package:flutter/material.dart';
import 'package:jurta/providers/providers.dart';
import 'package:jurta/screens/screens.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (c) => TabProvider(),
      builder: (c, w) => MaterialApp(
        title: 'Jurta',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          fontFamily: 'HelveticaNeueCyr',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Router(),
      ),
    );
  }
}

class Router extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RootScreen();
  }
}
