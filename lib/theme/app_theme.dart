import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData brightData = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 20, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
    ),
  );

  static ThemeData darkData = ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      textTheme: TextTheme(
        bodyLarge: TextStyle(fontSize: 20, color: Colors.white),
        bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
      ));
}
