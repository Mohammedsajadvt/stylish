import 'package:stylish/utils/index.dart';

class ProductList extends StatelessWidget {
  final ProductDataEvent event;

  const ProductList({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDataBloc()..add(event),
      child: SizedBox(
        height: ResponsiveHelper.getScreenHeight(context) * 0.3,
        child: BlocBuilder<ProductDataBloc, ProductDataState>(
          builder: (context, state) {
            if (state is ProductDataLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductDataLoaded) {
              final productData = state.productData;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.6,
                ),
                itemCount: productData.length,
                itemBuilder: (context, index) {
                  final product = productData[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(product: product),
                        ),
                      );
                    },
                    child: Card(
                      child: Stack(
                        children: [
                          Container(
                            width: ResponsiveHelper.getScreenHeight(context) *
                                0.230,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: ResponsiveHelper.getScreenHeight(
                                          context) *
                                      0.010,
                                ),
                                Image.network(
                                  product.image,
                                  fit: BoxFit.cover,
                                  height: ResponsiveHelper.getScreenHeight(
                                          context) *
                                      0.150,
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
                                  child: Row(
                                    children: [
                                      Text(
                                        '₹${product.price}',
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
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
                                    children: [
                                      ProductRating(rating: product.rating),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          BlocBuilder<WishlistBloc, WishlistState>(
                            builder: (context, wishlistState) {
                              bool isFavorite = false;

                              if (wishlistState is WishlistLoaded) {
                                isFavorite = wishlistState.wishlist
                                    .any((item) => item.name == product.name);
                              }

                              return Positioned(
                                top: 8,
                                right: 8,
                                child: IconButton(
                                  icon: Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color:
                                        isFavorite ? AppColors.red : Colors.grey,
                                  ),
                                  onPressed: () {
                                    if (isFavorite) {
                                      context.read<WishlistBloc>().add(
                                          RemoveProductFromWishlist(product));
                                    } else {
                                      context.read<WishlistBloc>().add(
                                          AddProductToWishlist(product));
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is ProductDataError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No product data available.'));
            }
          },
        ),
      ),
    );
  }
}
