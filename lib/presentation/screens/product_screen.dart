import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/blocs/favorite/favorite_bloc.dart';
import 'package:stylish/blocs/favorite/favorite_event.dart';
import 'package:stylish/blocs/favorite/favorite_state.dart';
import 'package:stylish/blocs/products/product_data_bloc.dart';
import 'package:stylish/blocs/products/product_data_event.dart';
import 'package:stylish/blocs/products/product_data_state.dart';
import 'package:stylish/presentation/screens/product_details_screen.dart';
import 'package:stylish/presentation/widgets/product_card.dart';
import 'package:stylish/presentation/widgets/product_rating.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/utils/helpers.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final event =
        ModalRoute.of(context)?.settings.arguments as String? ?? 'Products';

    ProductDataEvent productEvent;

    if (event == 'Mens') {
      productEvent = GetmensData();
      BlocProvider.of<ProductDataBloc>(context).add(productEvent);
    } else if (event == 'Womens') {
      productEvent = GetWomensData();
      BlocProvider.of<ProductDataBloc>(context).add(productEvent);
    } else {
      productEvent = GetmensData();
      BlocProvider.of<ProductDataBloc>(context).add(productEvent);
    }

    return BlocProvider(
      create: (context) => ProductDataBloc()..add(productEvent),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          scrolledUnderElevation: 0,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text(
              productEvent == 'Mens' ? 'Men\'s Products' : 'Women\'s Products'),
        ),
        body: BlocBuilder<ProductDataBloc, ProductDataState>(
          builder: (context, state) {
            if (state is ProductDataLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductDataLoaded) {
              final productData = state.productData;
              return GridView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveHelper.getScreenWidth(context) * 0.05,
                  vertical: ResponsiveHelper.getScreenHeight(context) * 0.02,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
                itemCount: productData.length,
                itemBuilder: (context, index) {
                  final product = productData[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) =>
                              ProductDetailScreen(product: product)));
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    ResponsiveHelper.getScreenHeight(context) *
                                        0.01,
                              ),
                              Image.network(
                                product.image,
                                fit: BoxFit.cover,
                                height:
                                    ResponsiveHelper.getScreenHeight(context) *
                                        0.15,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: ResponsiveHelper.getScreenHeight(
                                          context) *
                                      0.008,
                                  top: ResponsiveHelper.getScreenHeight(
                                          context) *
                                      0.008,
                                ),
                                child: Text(
                                  product.name,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: ResponsiveHelper.getScreenHeight(
                                          context) *
                                      0.008,
                                  top: ResponsiveHelper.getScreenHeight(
                                          context) *
                                      0.005,
                                ),
                                child: Text(
                                  product.description,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 10),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: ResponsiveHelper.getScreenHeight(
                                          context) *
                                      0.008,
                                  top: ResponsiveHelper.getScreenHeight(
                                          context) *
                                      0.004,
                                ),
                                child: Text(
                                  '₹${product.price}',
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: ResponsiveHelper.getScreenHeight(
                                          context) *
                                      0.008,
                                  top: ResponsiveHelper.getScreenHeight(
                                          context) *
                                      0.002,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ProductRating(rating: product.rating),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        BlocBuilder<FavoriteBloc, FavoriteState>(
                          builder: (context, state) {
                            bool isFavorite = false;
                            if (state is FavoriteUpdated) {
                              isFavorite = state.favorite.contains(product);
                            }
                            return Positioned(
                              top: 8,
                              right: 8,
                              child: IconButton(
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite ? AppColors.red : null,
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
                  );
                },
              );
            } else if (state is ProductDataError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No products available.'));
            }
          },
        ),
      ),
    );
  }
}
