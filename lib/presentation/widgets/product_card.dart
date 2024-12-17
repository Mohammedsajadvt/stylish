import 'package:stylish/utils/index.dart';

class ProductCard extends StatelessWidget {
  final ProductDataEvent event;

  const ProductCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDataBloc()..add(event),
      child: SizedBox(
        height: ResponsiveHelper.getScreenHeight(context) * 0.3,
        child: BlocBuilder<ProductDataBloc, ProductDataState>(
          builder: (context, state) {
            if (state is ProductDataLoading) {
              return Container();
            } else if (state is ProductDataLoaded) {
              final productData = state.productData;
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: productData.length,
                itemBuilder: (context, index) {
                  final product = productData[index];
                  return Padding(
                    padding: EdgeInsets.only(
                        right: ResponsiveHelper.getScreenWidth(context) * 0.050),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) =>
                                ProductDetailScreen(product: product)));
                      },
                      child: Card(
                        elevation: 0,
                        child: Stack(
                          children: [
                            Container(
                              width: ResponsiveHelper.getScreenHeight(context) *
                                  0.170,
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
                                  isFavorite = wishlistState.wishlist.any((item) => item.name == product.name);
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
                                      if (isFavorite) {
                                        context.read<WishlistBloc>().add(RemoveProductFromWishlist(product));
                                      } else {
                                        context.read<WishlistBloc>().add(AddProductToWishlist(product));
                                      }
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
