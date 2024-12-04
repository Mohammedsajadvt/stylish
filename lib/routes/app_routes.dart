import 'package:flutter/material.dart';
import 'package:stylish/presentation/screens/splash_screen.dart';

class AppRoutes {
  static const String splashscreen = '/';
  static const String  onboarding = '/onboarding';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashscreen:
        return MaterialPageRoute(builder: (_) =>  SplashScreen());
      case onboarding:
        final args = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => const SplashScreen()
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
