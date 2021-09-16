import 'package:logger/logger.dart';

class MyLogger {
  MyLogger._();

  static final MyLogger _instance = MyLogger._();

  static MyLogger get instance => _instance;

  final log = Logger(
    printer: PrettyPrinter(
        methodCount: 3,
        // number of method calls to be displayed
        errorMethodCount: 8,
        // number of method calls if stacktrace is provided
        lineLength: 60,
        // width of the output
        colors: false,
        // Colorful log messages
        printEmojis: true,
        // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        ),
  );
}
