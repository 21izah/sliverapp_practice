import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DropdownStateProvider extends ChangeNotifier {
  dynamic _selectedValue = 'Airtel';

  dynamic get selectedValue => _selectedValue;

  final List items = [
    'Airtel',
    'MTN',
    'GLO',
    '9Mobile',
  ];

  Future<void> saveSelectedvalue(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedValue', value);
    _selectedValue = value;
    notifyListeners();
  }

  Future<void> loadSelectedvalue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.getString('selectedValue') ?? _selectedValue;

    notifyListeners();
  }

  void toggleDropdowmnScheme(_selectedValue) async {
    if (_selectedValue == 'Airtel') {
      var locale = Locale('en');
      Get.updateLocale(locale);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('selectedValue', 'Airtel');
      // saveToPrefs();
      notifyListeners();
    } else if (_selectedValue == 'MTN') {
      var locale = Locale('de', 'DE');
      Get.updateLocale(locale);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('selectedValue', 'MTN');
      // saveToPrefs();
      notifyListeners();
    } else if (_selectedValue == 'GLO') {
      var locale = Locale('zh', 'CN');
      Get.updateLocale(locale);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('selectedValue', 'GLO');
      // saveToPrefs();
      notifyListeners();
    } else if (_selectedValue == '9Mobile') {
      var locale = Locale('es', 'ES');
      Get.updateLocale(locale);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('selectedValue', '9Mobile');
      // saveToPrefs();
      notifyListeners();
    }
    notifyListeners();
  }
}
