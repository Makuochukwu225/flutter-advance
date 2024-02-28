import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  final Future<SharedPreferences> _sharedPreferences =
      SharedPreferences.getInstance();

  ThemeMode? _mode;
  ThemeMode? get mode => _mode;

  Future<ThemeMode> getTheme() async {
    var pref = await _sharedPreferences;
    var theme = pref.getInt("THEME");
    print(theme);
    switch (theme) {
      case 0:
        return ThemeMode.system;

      case 1:
        return ThemeMode.light;

      case 2:
        return ThemeMode.dark;

      default:
        return ThemeMode.system;
    }
  }

  Future<void> setTheme(ThemeMode value) async {
    switch (value) {
      case ThemeMode.system:
        (await _sharedPreferences).setInt("THEME", 0);
        break;
      case ThemeMode.light:
        (await _sharedPreferences).setInt("THEME", 1);
        break;
      case ThemeMode.dark:
        (await _sharedPreferences).setInt("THEME", 2);
        break;
      default:
    }
  }
}
