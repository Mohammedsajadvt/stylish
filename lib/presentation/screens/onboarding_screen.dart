import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:stylish/utils/constants.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "Choose Products",
              body: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
              image:  Center(child: Image.asset(AppImages.fashionShop)),
              decoration: const PageDecoration(
                pageColor: AppColors.primary,
                titleTextStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: AppColors.secondary),
                bodyTextStyle: TextStyle(fontSize: 15,color: AppColors.grey),
              ),
            ),
             PageViewModel(
              title: "Make Payment",
              body: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
              image:  Center(child: Image.asset(AppImages.salesConsulting)),
              decoration: const PageDecoration(
                pageColor: AppColors.primary,
                titleTextStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: AppColors.secondary),
                bodyTextStyle: TextStyle(fontSize: 15,color: AppColors.grey),
              ),
            ),
            PageViewModel(
              title: "Get Your Order",
              body: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.",
              image:  Center(child: Image.asset(AppImages.shoppingBag)),
              decoration: const PageDecoration(
                pageColor: AppColors.primary,
                titleTextStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: AppColors.secondary),
                bodyTextStyle: TextStyle(fontSize: 15,color: AppColors.grey),
              ),
            ),
          ],
          onDone: () {
           
          },
          onSkip: () {
           
          },
          showSkipButton: true,
          skip: const Text("Skip",style: TextStyle(color: AppColors.secondary,fontWeight: FontWeight.bold),),
          next: const Text("Next",style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.red)),
          done: const Text("Get Started", style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.red)),
          dotsDecorator: const DotsDecorator(color: AppColors.grey,activeColor: AppColors.secondary,)
        ),
      ),
    );
  }
}
