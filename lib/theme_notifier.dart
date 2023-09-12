import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData = ThemeData.dark(); // Set dark theme as default

  ThemeNotifier() {
    loadTheme();
  }

  ThemeData getTheme() => _themeData;

  bool isDarkMode() {
    return _themeData.brightness == Brightness.dark;
  }

  void toggleTheme() {
    _themeData = isDarkMode() ? ThemeData.light() : ThemeData.dark();
    saveTheme(isDarkMode());
    notifyListeners();
  }

  Future<void> saveTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', isDark);
  }

  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDark = prefs.getBool('isDark') ?? true; // Set dark as default
    _themeData = isDark ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}
