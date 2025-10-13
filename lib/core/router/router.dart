import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/features/0_splash/view/splash_screen.dart';
import 'package:depi_graduation_project/features/1_introducation/view/introducation_screen.dart';
import 'package:depi_graduation_project/features/2_home/view/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splashPageRoute:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case AppRouteNames.introducationPageRoute:
        return MaterialPageRoute(builder: (context) => IntroducationScreen());
      case AppRouteNames.homePageRoute:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text("The Route Not Found"))),
        );
    }
  }
}
