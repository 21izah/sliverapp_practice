import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLightDarkMode extends ChangeNotifier {
  ChangeLightDarkMode() {
    getThemeAtInit();
  }

  getThemeAtInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isDarkTheme = sharedPreferences.getBool('is_dark');
    if (isDarkTheme != null && isDarkTheme!) {
      themeMode = ThemeMode.dark;
      notifyListeners();
    } else {
      themeMode = ThemeMode.light;
      notifyListeners();
    }
  }

  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkmodeEnabled => themeMode == ThemeMode.dark;

  void toggleColorScheme(bool isDarkModeOn) async {
    if (isDarkModeOn) {
      themeMode = ThemeMode.dark;
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('is_dark', isDarkmodeEnabled);
      // saveToPrefs();
      notifyListeners();
    } else {
      themeMode = ThemeMode.light;
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('is_dark', themeMode == ThemeMode.dark);
      // saveToPrefs();
      notifyListeners();
    }

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

class CzaHiveDataBase {
  ThemeMode themeMode = ThemeMode.system;
  final _mybox = Hive.box('mybox');

  void createInitial() {}

  void loadData() {
    themeMode = _mybox.get('TogglePosition');
  }

  void updateDataBase() {
    _mybox.put('TogglePosition', themeMode);
  }
}
