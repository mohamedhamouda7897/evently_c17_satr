import 'package:evently_c17_str/core/sdf.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  static final ThemeProvider instance = ThemeProvider._internal();

  factory ThemeProvider() {
    return instance;
  }

  ThemeProvider._internal();

  changeTheme(ThemeMode theme) {
    themeMode = theme;
    notifyListeners();
  }

  AppColors get appColors =>
      themeMode == ThemeMode.light ? LightAppColors() : DarkAppColors();
}
