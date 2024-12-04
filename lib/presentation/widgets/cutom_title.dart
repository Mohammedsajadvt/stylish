import 'package:flutter/material.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/utils/helpers.dart';

class CutomTitle extends StatelessWidget {
  final String title;
  const CutomTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    double titleFontSize = ResponsiveHelper.getScreenHeight(context) * 0.050;
    return Text(
      title,
      style: TextStyle(
          color: AppColors.secondary,
          fontSize: titleFontSize,
          fontWeight: FontWeight.bold),
    );
  }
}
