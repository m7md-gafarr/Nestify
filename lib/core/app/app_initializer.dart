import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/data/data_sources/local/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../firebase_options.dart';

class AppInitializer {
  static Future<String> initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Supabase.initialize(
      url: 'https://tmlanamjmwvkaneawpte.supabase.co',
      anonKey: 'sb_publishable_1eBzOrW0fSoFFWu5B8CJ-w_WMh9abOi',
    );

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await ScreenUtil.ensureScreenSize();

    final pref = SharedPreferencesService();
    await pref.init();

    final seen = await pref.loadOnboardingStatus() ?? false;
    final isLoggedIn = await pref.loadUserLoginStatus() ?? false;

    return seen
        ? (isLoggedIn
        ? AppRouteNames.homePageRoute
        : AppRouteNames.loginScreenRoute)
        : AppRouteNames.introducationPageRoute;
  }
}
