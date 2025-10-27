import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String LANGUAGE = "language";
  static const String THEME = "theme";
  static const String ONBOARDING = "onboarding";

  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();

  late SharedPreferences _prefs;

  factory SharedPreferencesService() {
    return _instance;
  }

  SharedPreferencesService._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<String?> loadSavedLanguage() async {
    return _prefs.getString(LANGUAGE);
  }

  Future<void> changeLanguage(String languageCode) async {
    await _prefs.setString(LANGUAGE, languageCode);
  }

  Future<String?> loadSavedTheme() async {
    return _prefs.getString(THEME);
  }

  Future<void> saveTheme(String themeMode) async {
    await _prefs.setString(THEME, themeMode);
  }

  Future<bool?> loadOnboardingStatus() async {
    return _prefs.getBool(ONBOARDING);
  }

  Future<void> saveOnboardingStatus(bool isCompleted) async {
    await _prefs.setBool(ONBOARDING, isCompleted);
  }
}
