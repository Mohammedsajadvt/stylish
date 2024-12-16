import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/blocs/favorite/favorite_bloc.dart';
import 'package:stylish/blocs/favorite/favorite_state.dart';
import 'package:stylish/blocs/products/product_data_event.dart';
import 'package:stylish/presentation/widgets/product_card.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/utils/helpers.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchTextEditingController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.backgroundColor,
        actions: [
          Padding(
            padding: EdgeInsets.all(
                ResponsiveHelper.getScreenHeight(context) * 0.008),
            child: const CircleAvatar(
              backgroundColor: AppColors.circleColor,
            ),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset(AppImages.centerLogo)],
        ),
        leading: Padding(
          padding: EdgeInsets.all(
              ResponsiveHelper.getScreenHeight(context) * 0.008),
          child: CircleAvatar(
              backgroundColor: AppColors.circleColor,
              child: Image.asset(AppImages.menu)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ResponsiveHelper.getScreenHeight(context) * 0.008),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ResponsiveHelper.getScreenHeight(context) * 0.030,
              ),
              TextFormField(
                controller: _searchTextEditingController,
                decoration: InputDecoration(
                  filled: true,
                  suffixIcon: const Icon(
                    Icons.mic,
                    color: AppColors.searchTextFieldIconColor,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.searchTextFieldIconColor,
                  ),
                  hintText: 'Search any Product...',
                  hintStyle: const TextStyle(
                    color: AppColors.searchTextFieldIconColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.primary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.primary),
                  ),
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.getScreenHeight(context) * 0.012,
              ),
              Padding(
                padding: EdgeInsets.all(
                    ResponsiveHelper.getScreenHeight(context) * 0.008),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '52,082+ Items',
                      style: TextStyle(
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w900,
                          fontSize:
                              ResponsiveHelper.getScreenHeight(context) *
                                  0.020),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(5)),
                            width: 70,
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Sort',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: ResponsiveHelper.getScreenWidth(
                                          context) *
                                      0.008,
                                ),
                                Image.asset(AppImages.short)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: ResponsiveHelper.getScreenWidth(context) *
                              0.035,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(5)),
                            width: 70,
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Filter',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: ResponsiveHelper.getScreenWidth(
                                          context) *
                                      0.008,
                                ),
                                Image.asset(AppImages.filter)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              BlocBuilder<FavoriteBloc, FavoriteState>(
                builder: (context, state) {
              List<ProductDataEvent> event = [
              GetWomensData(),
              GetmensData()
                  ];
                  if (state is FavoriteUpdated) {
                    if (state.favorite.isEmpty) {
                      return const Center(
                        child: Text(
                          "No favorites yet!",
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.favorite.length,
                      itemBuilder: (context, index) {
                        final product = state.favorite[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ProductCard(
                            event: event[index],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
