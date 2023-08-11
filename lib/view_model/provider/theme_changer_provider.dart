
import 'package:flutter/material.dart';
import 'package:itr_app/constants.dart';


class ThemeChanger with ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void setTheme(bool isDark){
    _themeMode = isDark? ThemeMode.dark:ThemeMode.light;
    colorsBasedOnTheme(_themeMode);
    notifyListeners();
  }
}