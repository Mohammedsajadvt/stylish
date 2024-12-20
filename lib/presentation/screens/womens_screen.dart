import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish/blocs/products/product_data_event.dart';
import 'package:stylish/presentation/widgets/product_list.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/utils/helpers.dart';

class WomensScreen extends StatelessWidget {
  const WomensScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Womens Products'),
        centerTitle: true,
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
      body: ProductList(
        event: GetWomensData(), 
      ),
    );
  }
}
