import 'package:flutter/material.dart';
import 'package:orchestrate/features/splash/views/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
}

mixin GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String? route = settings.name;
    // final arguments = settings.arguments;

    switch (route) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
    }
  }
}
