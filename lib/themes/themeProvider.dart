import 'package:flutter/material.dart';
import 'package:food_delivery_app/themes/darkMode.dart';

import 'lightMode.dart';

class Themeprovider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;
  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
    notifyListeners();
  }
}