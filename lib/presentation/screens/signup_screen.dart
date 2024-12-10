import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/blocs/auth/firebase_auth_bloc_bloc.dart';
import 'package:stylish/data/models/user_model.dart';
import 'package:stylish/presentation/widgets/custom_button.dart';
import 'package:stylish/presentation/widgets/custom_text_field.dart';
import 'package:stylish/presentation/widgets/cutom_title.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/utils/helpers.dart';
import 'package:stylish/utils/validators.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailOrUsernameController =
        TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return BlocBuilder<FirebaseAuthBloc, FirebaseAuthState>(
      builder: (context, state) {
        if (state is AuthendicatedState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, '/bottomnavbar');
          });
        }

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
                child: Form(
                  key: _formKey,
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
                        height:
                            ResponsiveHelper.getScreenHeight(context) * 0.040,
                      ),
                      CustomTextField(
                        controller: _emailOrUsernameController,
                        hintText: 'Email Address',
                        prefixIcon: Icons.person_rounded,
                        validator: FormValidators.validateEmail,
                      ),
                      SizedBox(
                        height:
                            ResponsiveHelper.getScreenHeight(context) * 0.035,
                      ),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: 'Password',
                        prefixIcon: Icons.lock,
                        suffixIcon: Icons.visibility,
                        validator: FormValidators.validatePassword,
                      ),
                      SizedBox(
                        height:
                            ResponsiveHelper.getScreenHeight(context) * 0.025,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              text: const TextSpan(
                                text: 'By clicking the',
                                style: TextStyle(
                                    fontSize: 16, color: AppColors.grey),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' Register',
                                    style: TextStyle(color: AppColors.red),
                                  ),
                                  TextSpan(
                                    text:
                                        ' button, you agree to the public offer',
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height:
                            ResponsiveHelper.getScreenHeight(context) * 0.050,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            UserModel user = UserModel(
                              _emailOrUsernameController.text,
                              _passwordController.text,
                            );
                            context
                                .read<FirebaseAuthBloc>()
                                .add(SignUpEvent(user: user));
                          }
                        },
                        child: const CustomButton(
                          title: 'Create Account',
                        ),
                      ),
                      SizedBox(
                        height:
                            ResponsiveHelper.getScreenHeight(context) * 0.060,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '- OR Continue with -',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height:
                            ResponsiveHelper.getScreenHeight(context) * 0.030,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<FirebaseAuthBloc>()
                                  .add(SignUpWithGoogle());
                            },
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
                            width: ResponsiveHelper.getScreenWidth(context) *
                                0.025,
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
                                  child: Image.asset(AppImages.github),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: ResponsiveHelper.getScreenWidth(context) *
                                0.025,
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<FirebaseAuthBloc>()
                                  .add(SignUpWithFacebook());
                            },
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
                        height:
                            ResponsiveHelper.getScreenHeight(context) * 0.025,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I Already Have an Account',
                            style: TextStyle(
                              fontSize:
                                  ResponsiveHelper.getScreenHeight(context) *
                                      0.020,
                            ),
                          ),
                          SizedBox(
                            width: ResponsiveHelper.getScreenWidth(context) *
                                0.015,
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
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
