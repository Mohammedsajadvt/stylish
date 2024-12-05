import 'package:flutter/material.dart';
import 'package:stylish/presentation/widgets/custom_button.dart';
import 'package:stylish/presentation/widgets/custom_text_field.dart';
import 'package:stylish/presentation/widgets/cutom_title.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/utils/helpers.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailOrUsernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: ResponsiveHelper.getScreenWidth(context) * 0.080,
              right: ResponsiveHelper.getScreenWidth(context) * 0.080,
              top: ResponsiveHelper.getScreenWidth(context) * 0.100),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  children: [
                    CutomTitle(
                      title: 'Create an\naccount',
                    )
                  ],
                ),
                SizedBox(
                  height: ResponsiveHelper.getScreenHeight(context) * 0.040,
                ),
                CustomTextField(
                    controller: _emailOrUsernameController,
                    hintText: 'Username or Email',
                    prefixIcon: Icons.person_rounded),
                SizedBox(
                  height: ResponsiveHelper.getScreenHeight(context) * 0.035,
                ),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility,
                ),
                SizedBox(
                  height: ResponsiveHelper.getScreenHeight(context) * 0.035,
                ),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Confirm Password',
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility,
                ),
                SizedBox(
                  height: ResponsiveHelper.getScreenHeight(context) * 0.025,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'By clicking the',
                          style: TextStyle(fontSize: 16,color: AppColors.grey),
                          children: const <TextSpan>[
                            TextSpan(
                                text: ' Register',
                                style: TextStyle(color: AppColors.red)),
                            TextSpan(text: ' button, you agree to the public offer'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: ResponsiveHelper.getScreenHeight(context) * 0.050,
                ),
                GestureDetector(
                    onTap: () {},
                    child: const CustomButton(
                      title: 'Create Account',
                    )),
                SizedBox(
                  height: ResponsiveHelper.getScreenHeight(context) * 0.060,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '- OR Continue with -',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: ResponsiveHelper.getScreenHeight(context) * 0.030,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.red,
                            width: 2.0,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: AppColors.primary,
                          child: Center(
                            child: Image.asset(AppImages.google),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ResponsiveHelper.getScreenWidth(context) * 0.025,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.red,
                            width: 2.0,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: AppColors.primary,
                          child: Center(
                            child: Image.asset(AppImages.apple),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ResponsiveHelper.getScreenWidth(context) * 0.025,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.red,
                            width: 2.0,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: AppColors.primary,
                          child: Center(
                            child: Image.asset(AppImages.facebook),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ResponsiveHelper.getScreenHeight(context) * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I Already Have an Account',
                      style: TextStyle(
                          fontSize: ResponsiveHelper.getScreenHeight(context) *
                              0.020),
                    ),
                    SizedBox(
                      width: ResponsiveHelper.getScreenWidth(context) * 0.015,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/signin');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: AppColors.red,
                            fontSize:
                                ResponsiveHelper.getScreenHeight(context) *
                                    0.020,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
