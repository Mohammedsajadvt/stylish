import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/blocs/categories/categories_bloc.dart';
import 'package:stylish/blocs/categories/categories_event.dart';
import 'package:stylish/blocs/categories/categories_state.dart';
import 'package:stylish/blocs/womens_data/womens_data_bloc.dart';
import 'package:stylish/blocs/womens_data/womens_data_state.dart';
import 'package:stylish/data/models/product_model.dart';
import 'package:stylish/presentation/widgets/carousel_slider.dart';
import 'package:stylish/presentation/widgets/categories_horizontal_list.dart';
import 'package:stylish/presentation/widgets/product_card.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/utils/helpers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchTextEditingController =
        TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHelper.getScreenWidth(context) * 0.020),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          actions: [
            Padding(
              padding: EdgeInsets.all(
                  ResponsiveHelper.getScreenHeight(context) * 0.008),
              child: GestureDetector(
                  onTap: () {},
                  child: GestureDetector(
                      onTap: () {},
                      child: const CircleAvatar(
                        backgroundColor: AppColors.circleColor,
                      ))),
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
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.getScreenHeight(context) * 0.008),
          child: BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              return RefreshIndicator(
                color: AppColors.red,
                onRefresh: () async {
                  context.read<CategoriesBloc>().add(GetCategories());
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height:
                            ResponsiveHelper.getScreenHeight(context) * 0.030,
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
                          hintText: 'Search any Product..',
                          hintStyle: const TextStyle(
                            color: AppColors.searchTextFieldIconColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: AppColors.primary),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: AppColors.primary),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: AppColors.primary),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: AppColors.red),
                          ),
                          fillColor: AppColors.primary,
                        ),
                      ),
                      SizedBox(
                        height:
                            ResponsiveHelper.getScreenHeight(context) * 0.012,
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                            ResponsiveHelper.getScreenHeight(context) * 0.008),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'All Featured',
                              style: TextStyle(
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.w900,
                                  fontSize: ResponsiveHelper.getScreenHeight(
                                          context) *
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Short',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          width:
                                              ResponsiveHelper.getScreenWidth(
                                                      context) *
                                                  0.008,
                                        ),
                                        Image.asset(AppImages.short)
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      ResponsiveHelper.getScreenWidth(context) *
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text('Filter',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          width:
                                              ResponsiveHelper.getScreenWidth(
                                                      context) *
                                                  0.008,
                                        ),
                                        Image.asset(AppImages.filter)
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height:
                            ResponsiveHelper.getScreenHeight(context) * 0.012,
                      ),
                      Container(
                        width: double.infinity,
                        height:
                            ResponsiveHelper.getScreenHeight(context) * 0.140,
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ResponsiveHelper.getScreenHeight(
                                          context) *
                                      0.012,
                                  vertical: ResponsiveHelper.getScreenHeight(
                                          context) *
                                      0.012),
                              child: CategoriesHorizontalList(),
                            )),
                      ),
                      SizedBox(
                        height:
                            ResponsiveHelper.getScreenHeight(context) * 0.012,
                      ),
                      CustomCarouselSlider(
                        images: const [
                          AppImages.carouselImage,
                          AppImages.carouselImage,
                          AppImages.carouselImage
                        ],
                      ),
                      SizedBox(
                        height:
                            ResponsiveHelper.getScreenHeight(context) * 0.025,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.blue),
                        width: double.infinity,
                        height:
                            ResponsiveHelper.getScreenHeight(context) * 0.080,
                        child: Padding(
                          padding: EdgeInsets.all(
                              ResponsiveHelper.getScreenHeight(context) *
                                  0.008),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Deal of the Day',
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize:
                                            ResponsiveHelper.getScreenHeight(
                                                    context) *
                                                0.020),
                                  ),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.av_timer,
                                        color: AppColors.primary,
                                      ),
                                      Text(
                                        '22h 55m 20s remaining ',
                                        style:
                                            TextStyle(color: AppColors.primary),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: ResponsiveHelper.getScreenHeight(
                                          context) *
                                      0.150,
                                  height: ResponsiveHelper.getScreenHeight(
                                          context) *
                                      0.040,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.blue,
                                      border:
                                          Border.all(color: AppColors.primary)),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'View all',
                                          style: TextStyle(
                                              fontSize: ResponsiveHelper
                                                      .getScreenHeight(
                                                          context) *
                                                  0.022,
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward,
                                          color: AppColors.primary,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height:
                            ResponsiveHelper.getScreenHeight(context) * 0.020,
                      ),
                      ProductCard(),
                      SizedBox(
                        height:
                            ResponsiveHelper.getScreenHeight(context) * 0.020,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.pink),
                        width: double.infinity,
                        height:
                            ResponsiveHelper.getScreenHeight(context) * 0.080,
                        child: Padding(
                          padding: EdgeInsets.all(
                              ResponsiveHelper.getScreenHeight(context) *
                                  0.008),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Trending Products ',
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize:
                                            ResponsiveHelper.getScreenHeight(
                                                    context) *
                                                0.020),
                                  ),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color: AppColors.primary,
                                      ),
                                      Text(
                                        'Last Date 29/02/22',
                                        style:
                                            TextStyle(color: AppColors.primary),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: ResponsiveHelper.getScreenHeight(
                                          context) *
                                      0.150,
                                  height: ResponsiveHelper.getScreenHeight(
                                          context) *
                                      0.040,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.pink,
                                      border:
                                          Border.all(color: AppColors.primary)),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'View all',
                                          style: TextStyle(
                                              fontSize: ResponsiveHelper
                                                      .getScreenHeight(
                                                          context) *
                                                  0.022,
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Icon(
                                          Icons.arrow_forward,
                                          color: AppColors.primary,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
