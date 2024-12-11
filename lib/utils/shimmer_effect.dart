import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stylish/utils/helpers.dart';


class ShimmerEffect extends StatelessWidget {
  final double? height;
  final double? width;

  const ShimmerEffect({super.key, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 400),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[400]!,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: ResponsiveHelper.getScreenHeight(context) * 0.02,
              ),
              Container(
                height:
                    ResponsiveHelper.getScreenHeight(context) * (height ?? 0.15),
                width: ResponsiveHelper.getScreenWidth(context) * (width ?? 0.85),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
              ),
            ],
          );
        },
      ),
    );
  }
}
