import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: avoid_classes_with_only_static_members
class FlutterFlowTheme {
  static const Color primaryColor = Color(0xFF333333);
  static const Color secondaryColor = Color(0xFFFF9929);
  static const Color tertiaryColor = Color(0xFFE5E5E5);

  static const Color white = Color(0xFFFFFFFF);
  static const Color dark = Color(0xFF131E34);

  String primaryFontFamily = 'Poppins';
  String secondaryFontFamily = 'Roboto';

  static TextStyle get title1 => GoogleFonts.getFont(
        'Roboto',
        color: white,
        fontWeight: FontWeight.w600,
        fontSize: 28,
      );
  static TextStyle get title2 => GoogleFonts.getFont(
        'Roboto',
        color: white,
        fontWeight: FontWeight.w500,
        fontSize: 23,
      );
  static TextStyle get title3 => GoogleFonts.getFont(
        'Roboto',
        color: white,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );
  static TextStyle get subtitle1 => GoogleFonts.getFont(
        'Roboto',
        color: white,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  static TextStyle get subtitle2 => GoogleFonts.getFont(
        'Roboto',
        color: dark,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      );
  static TextStyle get bodyText1 => GoogleFonts.getFont(
        'Roboto',
        color: dark,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      );
  static TextStyle get bodyText2 => GoogleFonts.getFont(
        'Roboto',
        color: dark,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override(
          {String fontFamily,
          Color color,
          double fontSize,
          FontWeight fontWeight,
          FontStyle fontStyle}) =>
      GoogleFonts.getFont(
        fontFamily,
        color: color ?? this.color,
        fontSize: fontSize ?? this.fontSize,
        fontWeight: fontWeight ?? this.fontWeight,
        fontStyle: fontStyle ?? this.fontStyle,
      );
}
