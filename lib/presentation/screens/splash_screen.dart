import 'package:flutter/material.dart';
import 'package:stylish/presentation/screens/onboarding_screen.dart';
import 'package:stylish/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(child: Center(child: Image.asset(AppImages.logo),)),
    );
}}