import 'package:flutter/material.dart';
import 'package:onboarding/screens/intro_screens/screen1/intro_screen.dart';
import 'package:onboarding/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kiwi',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.brightData,
        darkTheme: AppTheme.darkData,
        themeMode: ThemeMode.system,
        home: const IntroScreen());
  }
}
