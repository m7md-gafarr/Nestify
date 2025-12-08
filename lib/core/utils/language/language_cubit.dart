import 'dart:ui';

import 'package:depi_graduation_project/core/utils/language/language_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:depi_graduation_project/data/data_sources/local/shared_pref.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState(PlatformDispatcher.instance.locale)) {
    _checkLanguage();
  }

  Future<void> _checkLanguage() async {
    String? saved = await SharedPreferencesService().loadSavedLanguage();

    if (saved == null || saved.isEmpty) {
      await SharedPreferencesService().changeLanguage(
        state.locale.languageCode,
      );
    } else {
      if (saved != state.locale.languageCode) {
        emit(LanguageState(Locale(saved)));
      }
    }
  }

  Future<void> changeLanguage(String languageCode) async {
    final newLocale = Locale(languageCode);
    await SharedPreferencesService().changeLanguage(languageCode);
    emit(LanguageState(newLocale));
  }
}
