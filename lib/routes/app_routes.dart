import 'package:stylish/utils/index.dart';

class AppRoutes {
  static const String splashscreen = '/';
  static const String onboarding = '/onboarding';
  static const String signin = '/signin';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgotpassword';
  static const String bottomnavbar = "/bottomnavbar";
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
