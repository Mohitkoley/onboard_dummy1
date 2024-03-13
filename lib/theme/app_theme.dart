import 'package:flutter/material.dart';
import 'package:onboarding/theme/colors.dart';

class AppTheme {
  // ThemeData
  static ThemeData brightData = ThemeData.light().copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      elevatedButtonTheme: buttonTheme,
      scaffoldBackgroundColor: AppColors.white,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 20, color: AppColors.black),
        bodyMedium: TextStyle(fontSize: 16, color: AppColors.black),
      ),
      dividerColor: AppColors.supporterColor);

  static ThemeData darkData = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.black,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 20, color: AppColors.white),
        bodyMedium: TextStyle(fontSize: 16, color: AppColors.white),
      ),
      elevatedButtonTheme: buttonThemeDark,
      dividerColor: AppColors.supporterColor);

  // ElevatedButtonThemeData
  static ElevatedButtonThemeData buttonTheme = ElevatedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(AppColors.white),
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.secondryColor)));

  static ElevatedButtonThemeData buttonThemeDark = ElevatedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(AppColors.black),
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.secondryColor)));
}
