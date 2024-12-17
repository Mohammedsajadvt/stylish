import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/blocs/auth/firebase_auth_bloc_bloc.dart';
import 'package:stylish/blocs/favorite/wishlist_bloc.dart';
import 'package:stylish/blocs/favorite/wishlist_event.dart';
import 'package:stylish/blocs/favorite/wishlist_state.dart';
import 'package:stylish/presentation/screens/product_details_screen.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/utils/helpers.dart';


class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key}); 

  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WishlistBloc()..add(FetchWishlist()), 
      child: Padding(
        padding: EdgeInsets.symmetric(
           horizontal: ResponsiveHelper.getScreenWidth(context) * 0.020),

        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            scrolledUnderElevation: 0,
            actions: [
              BlocBuilder<FirebaseAuthBloc, FirebaseAuthState>(
                builder: (context, state) {
                  if(state is AuthendicatedState){
                    final user = state.user;
                    final image = user.photoURL;
                    return Padding(
                    padding: EdgeInsets.all(
                        ResponsiveHelper.getScreenHeight(context) * 0.008),
                    child: GestureDetector(
                        onTap: () {},
                        child: GestureDetector(
                            onTap: () {},
                            child: image!=null? CircleAvatar(
                              backgroundImage: NetworkImage(image.toString()),
                            ):const CircleAvatar(child: Icon(Icons.person))
                            )),
                  );
                  }else if (state is AuthLoading) {
              return const Center(child: CircularProgressIndicator(color: AppColors.red,));
            } else {
              return const Center(child: Text('Failed to load profile'));
            }
                },
              )
            ],
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(AppImages.centerLogo)],
            ),
            leading: Padding(
              padding: EdgeInsets.all(
                  ResponsiveHelper.getScreenHeight(context) * 0.008),
              child: GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                      backgroundColor: AppColors.circleColor,
                      child: Image.asset(AppImages.menu))),
            ),
          ),
          body: BlocBuilder<WishlistBloc, WishlistState>(
            builder: (context, state) {
              if (state is WishlistLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is WishlistLoaded) {
                if (state.wishlist.isEmpty) {
                  return const Center(child: const Text('No items in the wishlist.'));
                }
                return ListView.builder(
                  itemCount: state.wishlist.length,
                  itemBuilder: (context, index) {
                    final product = state.wishlist[index];
                    return GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) =>
                                ProductDetailScreen(product: product)));
                      },
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),                        color: AppColors.primary,
                      ),
                          child: ListTile(
                            leading: Image.network(product.image),
                            title: Text(product.name),
                            subtitle: Text('₹${product.price} | Rating: ${product.rating}'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete,color: AppColors.red,),
                              onPressed: () {
                                context.read<WishlistBloc>().add(RemoveProductFromWishlist(product));
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (state is WishlistError) {
                return Center(child: Text('Error: ${state.message}'));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
