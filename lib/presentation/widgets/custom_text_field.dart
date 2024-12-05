import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/blocs/bloc/visibility_bloc_bloc.dart';
import 'package:stylish/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this. suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisibilityBloc, VisibilityState>(
      builder: (context, state) {
        return TextField(
          controller: controller,
          obscureText: suffixIcon != null ? !state.isVisible : false,
          decoration: InputDecoration(
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      icon: Icon(
                        state.isVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.textfieldIcon,
                      ),
                      onPressed: () {
                        context
                            .read<VisibilityBloc>()
                            .add(ToggleVisibilityEvent());
                      },
                    )
                  : null,
              prefixIcon:  Icon(
                prefixIcon,
                color: AppColors.textfieldIcon,
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                  color: AppColors.textfieldBorderandHintText),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: AppColors.textfieldBorderandHintText)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppColors.textfieldBorderandHintText),
                  borderRadius: BorderRadius.circular(10)),
                  fillColor: AppColors.textfieldBackground,
                  ),
                  
        );
      },
    );
  }
}
