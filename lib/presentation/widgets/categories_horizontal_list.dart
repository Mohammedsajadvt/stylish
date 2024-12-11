import 'package:flutter/material.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/utils/helpers.dart';

class CategoriesHorizontalList extends StatelessWidget {
  // Categories data
  final List<Map<String, String>> categories = [
    {'name': 'Beauty', 'image': ProductsImages.beauty},
    {'name': 'Fashion', 'image': ProductsImages.fashion},
    {'name': 'Kids', 'image': ProductsImages.kids},
    {'name': 'Mens', 'image': ProductsImages.mens},
    {'name': 'Womens', 'image': ProductsImages.womens},
  ];

  CategoriesHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  print("Tapped on ${category['name']}");
                },
                child: Container(
                  width: ResponsiveHelper.getScreenWidth(context) * 0.15,
                  height: ResponsiveHelper.getScreenWidth(context) * 0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(category['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                category['name']!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
