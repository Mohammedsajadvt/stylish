import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stylish/blocs/auth/firebase_auth_bloc_bloc.dart';
import 'package:stylish/presentation/widgets/custom_text_field.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/utils/helpers.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void pickAndUploadProfileImage(
      BuildContext context, FirebaseAuthBloc bloc) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      bloc.add(UploadProfileImageEvent(image.path));
    }
  }

  void editEmail(BuildContext context, FirebaseAuthBloc bloc) {
    final TextEditingController emailController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.backgroundColor,
        title: const Text('Edit Email'),
        content: CustomTextField(controller: emailController, hintText: 'Enter New Email', prefixIcon: Icons.email),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('Cancel',style: TextStyle(color: AppColors.red),),
          ),
          TextButton(
            onPressed: () {
              bloc.add(UpdateEmailEvent(newEmail: emailController.text));
              Navigator.of(ctx).pop();
            },
            child: const Text('Update',style: TextStyle(color: AppColors.red)),
          ),
        ],
      ),
    );
  }

  void editPassword(BuildContext context, FirebaseAuthBloc bloc) {
    final TextEditingController passwordController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.backgroundColor,
        title: const Text('Edit Password'),
        content: CustomTextField(controller: passwordController, hintText: 'Enter New Password', prefixIcon: Icons.password,suffixIcon: Icons.visibility),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('Cancel',style:  TextStyle(color: AppColors.red),),
          ),
          TextButton(
            onPressed: () {
              bloc.add(
                  UpdatePasswordEvent(newPassword: passwordController.text));
              Navigator.of(ctx).pop();
            },
            child: const Text('Update',style:  TextStyle(color: AppColors.red),),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final firebaseAuthBloc = BlocProvider.of<FirebaseAuthBloc>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: const Icon(Icons.arrow_back_ios),
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: AppColors.secondary),
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
                  GestureDetector(
                    onTap: () =>
                        pickAndUploadProfileImage(context, firebaseAuthBloc),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius:
                              ResponsiveHelper.getScreenHeight(context) * 0.070,
                          backgroundImage: profileImageUrl != null
                              ? NetworkImage(profileImageUrl)
                              : null,
                          child: profileImageUrl == null
                              ? const Icon(Icons.person, size: 50)
                              : null,
                        ),
                        const Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                                backgroundColor: AppColors.blue,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: AppColors.primary,
                                )))
                      ],
                    ),
                  ),
                  SizedBox(
                      height:
                          ResponsiveHelper.getScreenHeight(context) * 0.050),
                  const Divider(
                    color: AppColors.textfieldBackground,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.email_sharp,
                      color: AppColors.textfieldIcon,
                    ),
                    title: const Text('Email',style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(
                      user.email ?? 'No Email',
                      style: TextStyle(
                          fontSize:
                              ResponsiveHelper.getScreenHeight(context) * 0.020,
                          fontWeight: FontWeight.bold,color: AppColors.textfieldHintText),
                    ),
                    trailing: IconButton(
                      color: AppColors.textfieldIcon,
                      icon: const Icon(Icons.edit),
                      onPressed: () => editEmail(context, firebaseAuthBloc),
                    ),
                  ),
                  const Divider(
                    color: AppColors.textfieldBackground,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.password,
                      color: AppColors.textfieldIcon,
                    ),
                    title: const Text('Password',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      'Change Your Password',
                      style: TextStyle(
                          fontSize:
                              ResponsiveHelper.getScreenHeight(context) * 0.020,
                          fontWeight: FontWeight.bold,color: AppColors.textfieldHintText),
                    ),
                    trailing: IconButton(
                      color: AppColors.textfieldIcon,
                      icon: const Icon(Icons.edit),
                      onPressed: () => editPassword(context, firebaseAuthBloc),
                    ),
                  ),
                  const Divider(
                    color: AppColors.textfieldBackground,
                  ),
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
