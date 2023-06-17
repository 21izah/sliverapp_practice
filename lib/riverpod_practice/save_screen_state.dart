// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class AppState with ChangeNotifier {
  String _pageState = '';
  String get pagestate => _pageState;

  void updatePageState(String newState) {
    _pageState = newState;

    notifyListeners();
  }

  void loadSavedState() async {
    final box = await Hive.openBox('pageStateBox');
    _pageState = box.get('pageState') ?? '';
    notifyListeners();
  }

  void saveState() async {
    final box = await Hive.openBox('pageStateBox');
    await box.put('pageState', _pageState);
  }

  void clearState() async {
    final box = await Hive.openBox('pageStateBox');
    await box.delete('pageState');
    _pageState = '';
    notifyListeners();
  }
}
