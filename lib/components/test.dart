import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String LANGUAGE = "language";
  static const String THEME = "theme";
  static const String ONBOARDING = "onboarding";
  static const String ISUSERLOGIN = "is_user_login";
  static const String USER_UID = "user_uid";

  static final SharedPreferencesService _instance =
  SharedPreferencesService._internal();

  late SharedPreferences _prefs;

  factory SharedPreferencesService() {
    return _instance;
  }

  SharedPreferencesService._internal();

  // Initialize SharedPreferences instance
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Language Methods
  Future<String?> loadSavedLanguage() async {
    return _prefs.getString(LANGUAGE);
  }

  Future<void> changeLanguage(String languageCode) async {
    await _prefs.setString(LANGUAGE, languageCode);
  }

  // Theme Methods
  Future<String?> loadSavedTheme() async {
    return _prefs.getString(THEME);
  }

  Future<void> saveTheme(String themeMode) async {
    await _prefs.setString(THEME, themeMode);
  }

  // Onboarding Methods
  Future<bool?> loadOnboardingStatus() async {
    return _prefs.getBool(ONBOARDING);
  }

  Future<void> saveOnboardingStatus(bool isCompleted) async {
    await _prefs.setBool(ONBOARDING, isCompleted);
  }

  // User Login Status Methods
  Future<bool?> loadUserLoginStatus() async {
    return _prefs.getBool(ISUSERLOGIN);
  }

  Future<void> saveUserLoginStatus(String uid) async {
    await _prefs.setBool(ISUSERLOGIN, true);
    await _prefs.setString(USER_UID, uid);
  }

  Future<void> logoutUserLoginStatus() async {
    await _prefs.setBool(ISUSERLOGIN, false);
    await _prefs.remove(USER_UID);
  }
}
