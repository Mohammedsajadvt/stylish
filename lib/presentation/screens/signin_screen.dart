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

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailOrUsernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    final authbloc = BlocProvider.of<FirebaseAuthBloc>(context);
    
    return BlocBuilder<FirebaseAuthBloc, FirebaseAuthState>(builder: (context, state) {
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
              top: ResponsiveHelper.getScreenWidth(context) * 0.100),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                    CustomTextField(
                      controller: _emailOrUsernameController,
                      hintText: 'Email Address',
                      prefixIcon: Icons.person_rounded,
                      validator: FormValidators.validateEmail,
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getScreenHeight(context) * 0.035,
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      prefixIcon: Icons.lock,
                      suffixIcon: Icons.visibility,
                      validator: FormValidators.validatePassword,
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getScreenHeight(context) * 0.010,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/forgotpassword');
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password?',
                            style: TextStyle(color: AppColors.red),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.getScreenHeight(context) * 0.050,
                    ),
                    GestureDetector(
                      onTap: () {
                       if (_formKey.currentState!.validate()) {
                            authbloc.add(LoginEvent(email: _emailOrUsernameController.text.trim(), password: _passwordController.text.trim()));
                          }
                      },
                      child: const CustomButton(
                        title: 'Login',
                      ),
                    ),
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
                      height: ResponsiveHelper.getScreenHeight(context) * 0.035,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create An Account',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.getScreenHeight(context) * 0.020),
                        ),
                        SizedBox(
                          width: ResponsiveHelper.getScreenWidth(context) * 0.015,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/signup');
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: AppColors.red,
                              fontSize: ResponsiveHelper.getScreenHeight(context) * 0.020,
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
        ),
      );
    });
  }
}
