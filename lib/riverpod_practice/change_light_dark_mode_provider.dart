import 'package:flutter/material.dart';

class ChangeLightDarkMode with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkmodeEnabled => themeMode == ThemeMode.dark;

  void toggleColorScheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class Mytheme {
  static final darkTheme = ThemeData(
      colorScheme: ColorScheme.dark(
    primary: Colors.grey[200]!,
    secondary: Colors.grey[300]!,
    tertiary: Colors.white,
  ));
  static final lightTheme = ThemeData(
      colorScheme: ColorScheme.light(
    primary: Colors.grey[900]!,
    secondary: Colors.grey[800]!,
    tertiary: Colors.black,
  ));
}
