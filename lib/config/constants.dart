import 'package:flutter/material.dart';

abstract final class Constants {
  // App name
  static const String appName = 'Gutendex App';

  // Primary app colors
  static const Color primaryColor = Color(
    0xFF5E56E7,
  ); // primary/main app seed color
  static const Color bgColor = Color(0xFFF8F7FF); // scaffold background color
  static const Color inputBgColor = Color(
    0xFFF0F0F6,
  ); // text input background color
  static const Color bodyTextColor = Color(0xFF333333); // body text color
  static const Color secondaryTextColor = Color(
    0xFFA0A0A0,
  ); // secondary text color
  static const Color appBarBgColor = Colors.white; // app bar background color

  // Font family and sizes
  static const String fontFamily = 'Montserrat';
  static const double heading1FontSize = 48.0;
  static const double heading2FontSize = 30.0;
  static const double genreCardFontSize = 20.0;
  static const double bodyFontSize = 16.0;
  static const double bookFontSize = 12.0;

  // Border radius
  static const double radius4 = 4.0;
  static const double radius8 = 8.0;

  // Padding
  static const double commonPadding = 10.0;
  static const double commonPaddingLarge = 20.0;
  static const double contentPadding = 20.0;

  // Spacer
  static const double spacer5 = 5;
  static const double spacer7 = 7;
  static const double spacer10 = 10;
  static const double spacer15 = 15;
  static const double spacer20 = 20;
  static const double spacer40 = 40;

  // API base url
  static const String apiBaseUrl = 'http://skunkworks.ignitesol.com:8000';

  // Common shadow
  static const List<BoxShadow> commonShadow = [
    BoxShadow(
      color: Color.fromRGBO(211, 209, 238, 0.5),
      blurRadius: 5,
      offset: Offset(0, 2),
      spreadRadius: 0,
    ),
  ];

  //
}
