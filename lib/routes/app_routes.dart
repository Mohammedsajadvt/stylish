import 'package:flutter/material.dart';
import 'package:stylish/presentation/screens/bottom_nav_bar.dart';
import 'package:stylish/presentation/screens/forgot_password_screen.dart';
import 'package:stylish/presentation/screens/getstarted_screen.dart';
import 'package:stylish/presentation/screens/onboarding_screen.dart';
import 'package:stylish/presentation/screens/signin_screen.dart';
import 'package:stylish/presentation/screens/signup_screen.dart';
import 'package:stylish/presentation/screens/splash_screen.dart';

class AppRoutes {
  static const String splashscreen = '/';
  static const String onboarding = '/onboarding';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgotpassword';
  static const String getstarted = "/getstarted";
  static const String bottomnavbar = "/bottomnavbar";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashscreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen()
        );
      case signin:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());     
      case forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());     
      case getstarted:
        return MaterialPageRoute(builder: (_) => const GetstartedScreen());     
      case bottomnavbar:
        return MaterialPageRoute(builder: (_) => const BottomNavBar());     
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
