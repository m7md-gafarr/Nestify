import 'package:depi_graduation_project/core/utils/language/language.dart';
import 'package:depi_graduation_project/core/utils/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => LanguageProvider()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ];
}
