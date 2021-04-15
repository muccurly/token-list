import 'package:flutter/foundation.dart';

/// avoid truncation of logged data
void log(dynamic text) {
  if (kDebugMode) {
    if (text != null) {
      RegExp('.{1,800}')
          .allMatches(text.toString())
          .forEach((match) => print(match.group(0)));
    } else {
      print('null');
    }
  }
}
