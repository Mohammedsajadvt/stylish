import 'package:flutter/material.dart';
import 'package:stylish/presentation/widgets/custom_button.dart';
import 'package:stylish/presentation/widgets/custom_text_field.dart';
import 'package:stylish/presentation/widgets/cutom_title.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/utils/helpers.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: ResponsiveHelper.getScreenWidth(context) * 0.080,
            right: ResponsiveHelper.getScreenWidth(context) * 0.080,
            top: ResponsiveHelper.getScreenWidth(context) * 0.100,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CutomTitle(
                  title: 'Forgot\nPassword?',
                ),
                SizedBox(
                  height: ResponsiveHelper.getScreenHeight(context) * 0.040,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: _emailController,
                        hintText: 'Enter your email address',
                        prefixIcon: Icons.email,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveHelper.getScreenHeight(context) * 0.030,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '* ',
                              style: TextStyle(
                                color: AppColors.red,
                              ),
                            ),
                            TextSpan(
                              text:
                                  'We will send you a message to set or reset your new password',
                              style: TextStyle(
                                color: AppColors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveHelper.getScreenHeight(context) * 0.040,
                ),
                const CustomButton(title: 'Submit')
              ],
            ),
          ),
        ),
      ),
    );
  }
}