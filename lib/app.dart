import 'package:depi_graduation_project/core/router/router.dart';
import 'package:depi_graduation_project/core/theme/app_theme/app_theme_dark.dart';
import 'package:depi_graduation_project/core/theme/app_theme/app_theme_light.dart';
import 'package:depi_graduation_project/core/utils/language/language.dart';
import 'package:depi_graduation_project/core/utils/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.initialRoute,
    required this.appRouter,
  });

  final String initialRoute;
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, __) => Consumer<LanguageProvider>(
        builder: (context, languageProvider, _) {
          return Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) {
              return MaterialApp(
                locale: languageProvider.locale,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: appRouter.generateRoute,
                initialRoute: initialRoute,
                themeMode: themeProvider.themeMode,
                theme: getThemeColorLight(
                  context,
                  languageProvider.locale,
                ),
                darkTheme: getThemeColorDark(
                  context,
                  languageProvider.locale,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
