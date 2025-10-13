import 'package:depi_graduation_project/core/router/route_names.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.homePageRoute:
        return MaterialPageRoute(builder: (context) => Text("main"));

      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text("The Route Not Found"))),
        );
    }
  }
}
