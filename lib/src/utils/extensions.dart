import 'package:flutter/services.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

extension on TextInputFormatter {
  String format(String text) {
    return formatEditUpdate(
      const TextEditingValue(),
      TextEditingValue(
        text: text,
        selection: TextSelection(
          baseOffset: text.length,
          extentOffset: text.length,
        ),
      ),
    ).text;
  }
}