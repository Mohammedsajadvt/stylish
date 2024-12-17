import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish/blocs/favorite/wishlist_bloc.dart';
import 'package:stylish/blocs/favorite/wishlist_event.dart';
import 'package:stylish/blocs/favorite/wishlist_state.dart';
import 'package:stylish/data/models/product_model.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/presentation/widgets/product_rating.dart';
import 'package:stylish/utils/helpers.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.primary,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          Padding(
            padding: EdgeInsets.all(
                ResponsiveHelper.getScreenWidth(context) * 0.030),
            child: const CircleAvatar(
                backgroundColor: AppColors.circleColor,
                child: Icon(CupertinoIcons.cart)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.all(ResponsiveHelper.getScreenHeight(context) * 0.016),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Center(
                  child: Image.network(
                    height: ResponsiveHelper.getScreenHeight(context) * 0.300,
                    product.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(
                  height: ResponsiveHelper.getScreenHeight(context) * 0.016),
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                  height: ResponsiveHelper.getScreenHeight(context) * 0.008),
              Text(
                product.description,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.getScreenHeight(context) * 0.020,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: ResponsiveHelper.getScreenHeight(context) * 0.040,
                    width: ResponsiveHelper.getScreenHeight(context) * 0.150,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          color: AppColors.grey,
                        ),
                        SizedBox(
                          width:
                              ResponsiveHelper.getScreenWidth(context) * 0.005,
                        ),
                        const Text(
                          'Nearest Store',
                          style: TextStyle(color: AppColors.grey),
                        )
                      ],
                    )),
                  ),
                  Container(
                    height: ResponsiveHelper.getScreenHeight(context) * 0.040,
                    width: ResponsiveHelper.getScreenHeight(context) * 0.070,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.lock,
                          color: AppColors.grey,
                        ),
                        SizedBox(
                          width:
                              ResponsiveHelper.getScreenWidth(context) * 0.005,
                        ),
                        const Text(
                          'Vip',
                          style: TextStyle(color: AppColors.grey),
                        )
                      ],
                    )),
                  ),
                  Container(
                    height: ResponsiveHelper.getScreenHeight(context) * 0.040,
                    width: ResponsiveHelper.getScreenHeight(context) * 0.150,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.rotate_90_degrees_ccw,
                          color: AppColors.grey,
                        ),
                        SizedBox(
                          width:
                              ResponsiveHelper.getScreenWidth(context) * 0.005,
                        ),
                        const Text(
                          'Return Policy',
                          style: TextStyle(color: AppColors.grey),
                        )
                      ],
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: ResponsiveHelper.getScreenHeight(context) * 0.020,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      
                    },
                    child: Container(
                      height: ResponsiveHelper.getScreenHeight(context) * 0.040,
                      width: ResponsiveHelper.getScreenHeight(context) * 0.120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.blue),
                      child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(CupertinoIcons.cart,color: AppColors.primary),
                          Text(
                            'Go to cart',
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ],
                      ),
                    ),
                  ),
                   GestureDetector(
                onTap: (){
                  
                },
                child: Container(
                  height: ResponsiveHelper.getScreenHeight(context) * 0.040,
                  width: ResponsiveHelper.getScreenHeight(context) * 0.120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.blue),
                  child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.ads_click,color: AppColors.primary),
                      Text(
                        'Buy Now',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
              ),
                ],
              ),
              
              SizedBox(
                height: ResponsiveHelper.getScreenHeight(context) * 0.020,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:const Color(0xffFFCCD5)),
                width: double.infinity,
                height: ResponsiveHelper.getScreenHeight(context) * 0.080,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: ResponsiveHelper.getScreenHeight(context) * 0.020),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Delivery in',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '1 within Hour',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                                ResponsiveHelper.getScreenHeight(context) *
                                    0.020),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
