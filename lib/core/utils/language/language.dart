import 'package:depi_graduation_project/data/repositories/local/shared_pref.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  LanguageProvider() {
    _locale = PlatformDispatcher.instance.locale;
    checkLanguage();
  }

  checkLanguage() async {
    String local = await SharedPreferencesService().loadSavedLanguage() ?? "";
    if (local.isEmpty) {
      await SharedPreferencesService().changeLanguage(_locale!.languageCode);
    } else {
      if (local != _locale!.languageCode) {
        _locale = Locale(local);
      }
    }
    notifyListeners();
  }

  Future<void> changeLanguage(String languageCode) async {
    _locale = Locale(languageCode);
    await SharedPreferencesService().changeLanguage(languageCode);
    notifyListeners();
  }
}
