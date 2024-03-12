import 'package:flutter/material.dart';
import 'package:onboarding/theme/colors.dart';

class AppTheme {
  static ThemeData brightData = ThemeData.light().copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      elevatedButtonTheme: buttonTheme,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 20, color: black),
        bodyMedium: TextStyle(fontSize: 16, color: black),
      ),
      dividerColor: supporterColor);

  static ThemeData darkData = ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 20, color: white),
        bodyMedium: TextStyle(fontSize: 16, color: white),
      ),
      elevatedButtonTheme: buttonThemeDark,
      dividerColor: supporterColor);

  static ElevatedButtonThemeData buttonTheme = ElevatedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(white),
          backgroundColor: MaterialStateProperty.all<Color>(secondryColor)));

  static ElevatedButtonThemeData buttonThemeDark = ElevatedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(black),
          backgroundColor: MaterialStateProperty.all<Color>(secondryColor)));
}
