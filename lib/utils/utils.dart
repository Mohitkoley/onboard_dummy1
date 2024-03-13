import 'package:flutter/material.dart';

class Utils {}

extension ContextExt on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  TextStyle get bodyLarge => textTheme.bodyLarge!;

  TextStyle get bodyMedium => textTheme.bodyMedium!;

  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }

  ColorScheme get colorScheme => theme.colorScheme;

  Color get schemeBackroundColor => colorScheme.background;

  Color get primaryColor => colorScheme.primary;

  //Navigators
  void navigateTo(Widget screen) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => screen));
  }
}

extension DoubleExt on num {
  Widget get hBox => SizedBox(height: toDouble());
  Widget get wBox => SizedBox(width: toDouble());
  Widget get hwBox => SizedBox(height: toDouble(), width: toDouble());
}
