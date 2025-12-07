import 'package:depi_graduation_project/app.dart';
import 'package:depi_graduation_project/core/app/app_bloc_providers.dart';
import 'package:depi_graduation_project/core/app/app_initializer.dart';
import 'package:depi_graduation_project/core/app/app_providers.dart';
import 'package:depi_graduation_project/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  final initialRoute = await AppInitializer.initializeApp();

  runApp(
    MultiProvider(
      providers: AppProviders.providers,
      child: MultiBlocProvider(
        providers: AppBlocProviders.providers,
        child: MyApp(
          initialRoute: initialRoute,
          appRouter: AppRouter(),
        ),
      ),
    ),
  );
}
