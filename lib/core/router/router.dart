import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:depi_graduation_project/features/introducation/view/introducation_screen.dart';
import 'package:depi_graduation_project/features/home/view/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
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
