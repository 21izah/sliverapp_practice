import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// enum ThemeMode { light, dart, system }

class ThemeProvider with ChangeNotifier {
  // ThemeMode _themeMode;
  // ThemeMode get themeMode => _themeMode;

  // ThemeProvider() {
  //   _loadThemeMode();
  // }

  // void _loadThemeMode() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final savedThemeMode = prefs.getString('themeMode');

  //   if (savedThemeMode == null) {
  //     _themeMode = ThemeMode.system;
  //   } else {
  //     _themeMode = ThemeMode.values.firstWhere(
  //       (mode) => mode.toString() == savedThemeMode,
  //       orElse: () => ThemeMode.system,
  //     );
  //   }

  //   notifyListeners();
  // }

  // Future<void> setThemeMode(ThemeMode mode) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('themeMode', mode.toString());

  //   _themeMode = mode;
  //   notifyListeners();
  // }
}
