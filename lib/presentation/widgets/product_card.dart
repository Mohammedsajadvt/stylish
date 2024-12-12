
import 'package:flutter/material.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/utils/helpers.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveHelper.getScreenHeight(context) * 0.3,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.only(right:ResponsiveHelper.getScreenWidth(context) * 0.050),
            child: Card(
              elevation: 0,
              child: Container(
                width: 170,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
