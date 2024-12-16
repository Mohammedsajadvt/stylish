import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/blocs/favorite/favorite_bloc.dart';
import 'package:stylish/blocs/favorite/favorite_event.dart';
import 'package:stylish/blocs/favorite/favorite_state.dart';
import 'package:stylish/data/models/product_model.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/presentation/widgets/product_rating.dart';

class ProductDetailScreen extends StatelessWidget {

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductModel? product; 

    return Scaffold(
      appBar: AppBar(
        title: Text(product!.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  height: 250,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Price: ₹${product.price}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              ProductRating(rating: product.rating),
              const SizedBox(height: 16),
              BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
                  bool isFavorite = false;
                  if (state is FavoriteUpdated) {
                    isFavorite = state.favorite.contains(product);
                  }
                  return Center(
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? AppColors.red : null,
                        size: 32,
                      ),
                      onPressed: () {
                        context
                            .read<FavoriteBloc>()
                            .add(ToggleFavoriteEvent(product));
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
