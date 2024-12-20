import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/blocs/auth/firebase_auth_bloc_bloc.dart';
import 'package:stylish/blocs/upload_image/upload_image_bloc.dart';
import 'package:stylish/blocs/upload_image/upload_image_event.dart';
import 'package:stylish/utils/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylish/utils/helpers.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuthBloc = BlocProvider.of<FirebaseAuthBloc>(context);
    final imageUploadBloc = BlocProvider.of<ImageUploadBloc>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
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
            ),
          ),
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
        builder: (context, authState) {
          if (authState is AuthendicatedState) {
            final user = authState.user;
            final profileImageUrl = user.photoURL;

            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: ResponsiveHelper.getScreenHeight(context) * 0.020,
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: ResponsiveHelper.getScreenHeight(context) * 0.070,
                        backgroundImage: profileImageUrl != null
                            ? NetworkImage(profileImageUrl)
                            : null,
                        child: profileImageUrl == null
                            ? const Icon(Icons.person, size: 50)
                            : null,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () async {
                            final picker = ImagePicker();
                            final XFile? pickedFile = await picker.pickImage(
                              source: ImageSource.gallery,
                            );
                            if (pickedFile != null) {
                              imageUploadBloc.add(UploadImageEvent(image: pickedFile));
                            }
                          },
                          child: const CircleAvatar(
                            backgroundColor: AppColors.blue,
                            child: Icon(
                              Icons.edit,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: ResponsiveHelper.getScreenHeight(context) * 0.050,
                  ),
                  const Divider(color: AppColors.textfieldBackground),
                  ListTile(
                    leading: const Icon(Icons.email_sharp, color: AppColors.textfieldIcon),
                    title: const Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      user.email ?? 'No Email',
                      style: TextStyle(
                        fontSize: ResponsiveHelper.getScreenHeight(context) * 0.020,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textfieldHintText,
                      ),
                    ),
                  ),
                  const Divider(color: AppColors.textfieldBackground),
                  ListTile(
                    leading: const Icon(Icons.password, color: AppColors.textfieldIcon),
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
                          fontSize: ResponsiveHelper.getScreenHeight(context) * 0.020,
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
          } else if (authState is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('Failed to load profile'));
          }
        },
      ),
    );
  }
}
