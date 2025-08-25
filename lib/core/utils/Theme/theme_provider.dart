import 'package:depi_graduation_project/data/repositories/local/shared_pref.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final savedTheme = await SharedPreferencesService().loadSavedTheme();
    if (savedTheme == 'dark') {
      _themeMode = ThemeMode.dark;
    } else if (savedTheme == 'light') {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.system;
    }
    notifyListeners();
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    _themeMode = themeMode;
    final themeStr = themeMode == ThemeMode.dark ? 'dark' : 'light';
    await SharedPreferencesService().saveTheme(themeStr);
    notifyListeners();
  }
}
