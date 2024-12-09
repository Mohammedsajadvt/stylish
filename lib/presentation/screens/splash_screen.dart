import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/blocs/auth/firebase_auth_bloc_bloc.dart';
import 'package:stylish/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FirebaseAuthBloc, FirebaseAuthState>(
      listener: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (state is AuthendicatedState) {
            Navigator.pushReplacementNamed(context, '/bottomnavbar');
          } else if (state is UnAthendicated) {
            Navigator.pushReplacementNamed(context, '/onboarding');
          }
        });
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
            child: Center(
          child: Image.asset(AppImages.logo),
        )),
      ),
    );
  }
}
