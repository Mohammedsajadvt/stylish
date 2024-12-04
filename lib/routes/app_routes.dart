import 'package:flutter/material.dart';
import 'package:stylish/presentation/screens/onboarding_screen.dart';
import 'package:stylish/presentation/screens/signin_screen.dart';
import 'package:stylish/presentation/screens/signup_screen.dart';
import 'package:stylish/presentation/screens/splash_screen.dart';

class AppRoutes {
  static const String splashscreen = '/';
  static const String onboarding = '/onboarding';
  static const String signin = '/signin';
  static const String signup = '/signup';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashscreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen()
        );
      case signin:
        return MaterialPageRoute(builder: (_) => const SigninScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());     
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
