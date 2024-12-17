import 'package:flutter/cupertino.dart';
import 'package:stylish/utils/index.dart';

class BeautyScreen extends StatelessWidget {
  const BeautyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text('Beauty Products'),
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
        event: GetBeautyData(),  
      ),
    );
  }
}
