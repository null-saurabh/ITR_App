
import 'package:flutter/material.dart';
import 'package:itr_app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ThemeChanger with ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  ThemeChanger() {
    _loadThemeMode();
  }

  void setTheme(bool isDark) async{
    _themeMode = isDark? ThemeMode.dark:ThemeMode.light;
    colorsBasedOnTheme(_themeMode);
    notifyListeners();
    await _saveThemeMode(isDark);
  }
  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? false;
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    colorsBasedOnTheme(_themeMode);
    notifyListeners();
  }
  Future<void> _saveThemeMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', isDark);
  }
}