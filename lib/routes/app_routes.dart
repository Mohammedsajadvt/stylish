import 'package:flutter/material.dart';
import 'package:stylish/data/models/product_model.dart';
import 'package:stylish/presentation/screens/bottom_nav_bar.dart';
import 'package:stylish/presentation/screens/forgot_password_screen.dart';
import 'package:stylish/presentation/screens/onboarding_screen.dart';
import 'package:stylish/presentation/screens/product_details_screen.dart';
import 'package:stylish/presentation/screens/product_screen.dart';
import 'package:stylish/presentation/screens/signin_screen.dart';
import 'package:stylish/presentation/screens/signup_screen.dart';
import 'package:stylish/presentation/screens/splash_screen.dart';

class AppRoutes {
  static const String splashscreen = '/';
  static const String onboarding = '/onboarding';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgotpassword';
  static const String bottomnavbar = "/bottomnavbar";
  static const String product = "/product";
  static const String productDetails = "/productdetails";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    ProductModel? products;
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
      case bottomnavbar:
        return MaterialPageRoute(builder: (_) => const BottomNavBar());  
      case product:
        return MaterialPageRoute(builder: (_)=> const ProductScreen());     
      case productDetails:
        return MaterialPageRoute(builder: (_)=> ProductDetailScreen(product: products!,));     
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
