import 'package:flutter/material.dart';
import 'package:orchestrate/features/authentication/views/login_screen.dart';
import 'package:orchestrate/features/authentication/views/otp_screen.dart';
import 'package:orchestrate/features/authentication/views/signup_screen.dart';
import 'package:orchestrate/features/home/views/home_screen.dart';
import 'package:orchestrate/features/splash/views/splash_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String loginScreen = '/loginScreen';
  static const String signupScreen = '/signupScreen';
  static const String otpScreen = '/otpScreen';

  static const String homeScreen = '/homeScreen';
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

      case '/loginScreen':
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: settings,
        );

      case '/signupScreen':
        return MaterialPageRoute(
          builder: (context) => const SignupScreen(),
          settings: settings,
        );

      case '/otpScreen':
        return MaterialPageRoute(
          builder: (context) => const OTPScreen(),
          settings: settings,
        );

      case 'homeScreen':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
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
