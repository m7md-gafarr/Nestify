import 'package:depi_graduation_project/core/utils/theme/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:depi_graduation_project/data/data_sources/local/shared_pref.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(ThemeMode.system)) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final savedTheme = await SharedPreferencesService().loadSavedTheme();

    if (savedTheme == 'dark') {
      emit(ThemeState(ThemeMode.dark));
    } else if (savedTheme == 'light') {
      emit(ThemeState(ThemeMode.light));
    } else {
      emit(ThemeState(ThemeMode.system));
    }
  }

  Future<void> changeTheme(ThemeMode themeMode) async {
    final themeStr = themeMode == ThemeMode.dark ? 'dark' : 'light';

    await SharedPreferencesService().saveTheme(themeStr);

    emit(ThemeState(themeMode));
  }
}
