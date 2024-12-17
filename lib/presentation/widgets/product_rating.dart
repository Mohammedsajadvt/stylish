import 'package:stylish/utils/index.dart';

class ProductRating extends StatelessWidget {
  final double rating;

  const ProductRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    int halfStars = (rating - fullStars >= 0.5) ? 1 : 0;
    int emptyStars = 5 - fullStars - halfStars;

    return Row(
      children: [
        for (int i = 0; i < fullStars; i++)
         const Icon(Icons.star, color: AppColors.star),
        for (int i = 0; i < halfStars; i++)
         const  Icon(Icons.star_half, color: AppColors.searchTextFieldIconColor),
        for (int i = 0; i < emptyStars; i++)
         const  Icon(Icons.star_border, color: AppColors.searchTextFieldIconColor),
      ],
    );
  }
}
