import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onboarding/const/resource.dart';
import 'package:onboarding/screens/home_screen.dart';
import 'package:onboarding/screens/on_board_screen.dart';
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
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.brightData,
        darkTheme: AppTheme.darkData,
        themeMode: ThemeMode.system,
        home: const IntroScreen());
  }
}
