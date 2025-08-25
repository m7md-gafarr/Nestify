import 'package:depi_graduation_project/features/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:depi_graduation_project/routes/route_name.dart';

class AppRouter {
  Route generate_route(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.homeScreenRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text("The Route Not Found"))),
        );
    }
  }
}
