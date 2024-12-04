import 'package:flutter/material.dart';
import 'package:stylish/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(
        context,
        '/onboarding'
      );
    });
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(child: Center(child: Image.asset(AppImages.logo),)),
    );
}}