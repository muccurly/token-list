import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jurta/providers/providers.dart';
import 'package:jurta/screens/screens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

void main() {
  /// Ensure that plugin services are initialized
  WidgetsFlutterBinding.ensureInitialized();

  /// add font licenses
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jurta',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'HelveticaNeueCyr',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RootScreen(),
    );
  }
}
