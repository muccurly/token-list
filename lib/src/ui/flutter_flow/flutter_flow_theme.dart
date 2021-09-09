import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class FlutterFlowTheme {
  static const Color primaryColor = Color(0xFFFF9929);
  static const Color secondaryColor = Color(0xFF131E34);
  static const Color tertiaryColor = Color(0xFFE5E5E5);

  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFF4A5056);
  static const Color green = Color(0xFF00CABF);
  static const Color deny = Color(0xFFC85D5D);
  static const Color approve = Color(0xFF62B68A);
  static const Color lightGrey = Color(0xFFCBCBCB);
  static const Color dark = Color(0xFF333333);

  static String primaryFontFamily = 'HelveticaNeueCyr';
  static String secondaryFontFamily = 'HelveticaNeueCyr';

  static TextStyle get titleText => TextStyle(
        fontFamily: primaryFontFamily,
        color: white,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      );
  static TextStyle get subtitleText => TextStyle(
        fontFamily: primaryFontFamily,
        color: white,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );
  static TextStyle get subtitle2Text => TextStyle(
        fontFamily: primaryFontFamily,
        color: white,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      );

  static TextStyle get titleTextWDark => TextStyle(
        fontFamily: primaryFontFamily,
        color: dark,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      );
  static TextStyle get subtitleTextDark => TextStyle(
        fontFamily: primaryFontFamily,
        color: dark,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );
  static TextStyle get subtitle2TextDark => TextStyle(
        fontFamily: primaryFontFamily,
        color: dark,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      );
  static TextStyle get bodyTextDark => TextStyle(
        fontFamily: primaryFontFamily,
        color: dark,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );
  static TextStyle get bodyTextGrey => TextStyle(
        fontFamily: primaryFontFamily,
        color: grey,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );
  static TextStyle get bodyTextWhite => TextStyle(
        fontFamily: primaryFontFamily,
        color: white,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );
  static TextStyle get searchPageTitle => TextStyle(
        fontFamily: primaryFontFamily,
        color: dark,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      );
  static TextStyle get filterTitle => TextStyle(
        fontFamily: primaryFontFamily,
        color: white,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      );

  static TextStyle get hintStyle => TextStyle(
        fontFamily: primaryFontFamily,
        color: grey,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );

  static TextStyle get darkNormal16 => TextStyle(
        fontFamily: primaryFontFamily,
        color: dark,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      );
  static TextStyle get dark50016 => TextStyle(
        fontFamily: primaryFontFamily,
        color: dark,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );

  static TextStyle get btnTextWhite => TextStyle(
        fontFamily: primaryFontFamily,
        color: white,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      );

  static TextStyle get clickTextDark => TextStyle(
        fontFamily: primaryFontFamily,
        color: dark,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );
  static TextStyle get clickTextwhite => TextStyle(
        fontFamily: primaryFontFamily,
        color: white,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );
}
