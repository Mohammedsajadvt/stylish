import 'package:flutter/material.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/utils/helpers.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchTextEditingController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ResponsiveHelper.getScreenWidth(context) * 0.020),
      child: Scaffold(
        appBar: AppBar(
            scrolledUnderElevation: 0,
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
            padding:  EdgeInsets.symmetric(horizontal: ResponsiveHelper.getScreenHeight(context) * 0.008),
            child: SingleChildScrollView(
              child: Column(children: [
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
                    hintText: 'Search any Product..',
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
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: AppColors.red),
                    ),
                    fillColor: AppColors.primary,
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
                        '52,082+ Iteams',
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
                                    'Short',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
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
                                  const Text('Filter',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(
                                    width: ResponsiveHelper.getScreenWidth(
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
              ],),
            ),
          ),
      ),
    );
  }
}