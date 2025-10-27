import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/core/router/router.dart';
import 'package:depi_graduation_project/core/theme/app_theme/app_theme_dark.dart';
import 'package:depi_graduation_project/core/theme/app_theme/app_theme_light.dart';
import 'package:depi_graduation_project/core/utils/Theme/theme_provider.dart';
import 'package:depi_graduation_project/core/utils/language/language.dart';
import 'package:depi_graduation_project/data/data_sources/local/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

String? _initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await dotenv.load(fileName: ".env");
  SharedPreferencesService pref = SharedPreferencesService();
  await pref.init();
  bool? seen = await pref.loadOnboardingStatus();
  _initialRoute = seen == true
      ? AppRouteNames.homePageRoute
      : AppRouteNames.introducationPageRoute;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(appRouter: AppRouter()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (_, child) => Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) {
              return MaterialApp(
                locale: languageProvider.locale,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: appRouter.generateRoute,
                initialRoute: _initialRoute,
                themeMode: themeProvider.themeMode,
                theme: getThemeColorLight(context, languageProvider.locale),
                darkTheme: getThemeColorDark(context, languageProvider.locale),
              );
            },
          );
        },
      ),
    );
  }
}
