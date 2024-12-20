import 'package:stylish/utils/index.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this. suffixIcon,
    this.validator
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisibilityBloc, VisibilityState>(
      builder: (context, state) {
        return TextFormField(
          controller: controller,
          obscureText: suffixIcon != null ? !state.isVisible : false,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
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
                  color: AppColors.textfieldHintText),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: AppColors.textfieldBorder)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: AppColors.textfieldBorder)),        
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: AppColors.textfieldBorder),
                  borderRadius: BorderRadius.circular(10)),
                  fillColor: AppColors.textfieldBackground,
                  ),                  
        );
      },
    );
  }
}
