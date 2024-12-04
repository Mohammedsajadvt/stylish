import 'package:flutter/material.dart';
import 'package:stylish/presentation/widgets/cutom_title.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/utils/helpers.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: ResponsiveHelper.getScreenWidth(context) * 0.080,
              right: ResponsiveHelper.getScreenWidth(context) * 0.080,
              top: ResponsiveHelper.getScreenWidth(context) * 0.100),
          child: Column(
            children: [
              const Row(
                children: [
                  CutomTitle(
                    title: 'Welcome\nBack!',
                  )
                ],
              ),
              SizedBox(
                height: ResponsiveHelper.getScreenHeight(context) * 0.040,
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person_rounded,
                      color: AppColors.textfieldIcon,
                    ),
                    hintText: 'Username or Email',
                    hintStyle: const TextStyle(
                        color: AppColors.textfieldBorderandHintText),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: AppColors.textfieldBorderandHintText)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.textfieldBorderandHintText),
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: ResponsiveHelper.getScreenHeight(context) * 0.035,
              ),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: AppColors.textfieldIcon,
                    ),
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                        color: AppColors.textfieldBorderandHintText),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: AppColors.textfieldBorderandHintText)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: AppColors.textfieldBorderandHintText),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
