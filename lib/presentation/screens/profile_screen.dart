import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/blocs/auth/firebase_auth_bloc_bloc.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/utils/helpers.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuthBloc = BlocProvider.of<FirebaseAuthBloc>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                context.read<FirebaseAuthBloc>().add(LogoutEvent());
                await Future.delayed(const Duration(seconds: 1));
                Navigator.of(context).pushNamed('/signin');
              },
              icon: const Icon(
                Icons.logout,
                color: AppColors.red,
              ))
        ],
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.secondary,
          ),
        ),
      ),
      body: BlocBuilder<FirebaseAuthBloc, FirebaseAuthState>(
        builder: (context, state) {
          if (state is AuthendicatedState) {
            final user = state.user;
            final profileImageUrl = user.photoURL;

            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height:
                          ResponsiveHelper.getScreenHeight(context) * 0.020),
                  CircleAvatar(
                    radius: ResponsiveHelper.getScreenHeight(context) * 0.070,
                    backgroundImage: profileImageUrl != null
                        ? NetworkImage(profileImageUrl)
                        : null,
                    child: profileImageUrl == null
                        ? const Icon(Icons.person, size: 50)
                        : null,
                  ),
                  SizedBox(
                      height:
                          ResponsiveHelper.getScreenHeight(context) * 0.050),
                  const Divider(color: AppColors.textfieldBackground),
                  ListTile(
                    leading: const Icon(Icons.email_sharp,
                        color: AppColors.textfieldIcon),
                    title: const Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      user.email ?? 'No Email',
                      style: TextStyle(
                        fontSize:
                            ResponsiveHelper.getScreenHeight(context) * 0.020,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textfieldHintText,
                      ),
                    ),
                  ),
                  const Divider(color: AppColors.textfieldBackground),
                  ListTile(
                    leading: const Icon(Icons.password,
                        color: AppColors.textfieldIcon),
                    title: const Text(
                      'Password',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/forgotpassword');
                      },
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize:
                              ResponsiveHelper.getScreenHeight(context) * 0.020,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  ),
                  const Divider(color: AppColors.textfieldBackground),
                ],
              ),
            );
          } else if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Failed to load profile'));
          }
        },
      ),
    );
  }
}
