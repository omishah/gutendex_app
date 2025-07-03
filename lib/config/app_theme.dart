import 'package:flutter/material.dart';
import 'package:gutendex_app/config/constants.dart';

abstract class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    fontFamily: Constants.fontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Constants.primaryColor,
      brightness: Brightness.light,
      surface: Constants.bgColor,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: Constants.bodyFontSize,
        color: Constants.bodyTextColor,
      ),
      displayLarge: TextStyle(
        color: Constants.primaryColor,
        fontSize: Constants.heading1FontSize,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: TextStyle(
        color: Constants.primaryColor,
        fontSize: Constants.heading2FontSize,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: TextStyle(
        color: Colors.black,
        fontSize: Constants.genreCardFontSize,
        fontWeight: FontWeight.w600,
      ),
    ),
    appBarTheme: const AppBarTheme(
      titleSpacing: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Constants.appBarBgColor,
      titleTextStyle: TextStyle(
        fontFamily: Constants.fontFamily,
        color: Constants.primaryColor,
        fontSize: Constants.heading2FontSize,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
