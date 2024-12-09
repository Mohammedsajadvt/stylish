import 'package:flutter/material.dart';
import 'package:stylish/presentation/widgets/custom_button.dart';
import 'package:stylish/utils/constants.dart';
import 'package:stylish/utils/helpers.dart';

class GetstartedScreen extends StatelessWidget {
  const GetstartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
               AppColors.secondary.withOpacity(0.2), 
              BlendMode.darken,
            ),
            image: const AssetImage(AppImages.cloth),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'You want Authentic, here you go!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 50,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height:ResponsiveHelper.getScreenHeight(context) * 0.022,),
            const Text('Find it here, buy it now!',style: TextStyle(color: AppColors.primary,fontSize: 18),),
            SizedBox(height:ResponsiveHelper.getScreenHeight(context) * 0.050,),
            Padding(
              padding:  EdgeInsets.only(left:ResponsiveHelper.getScreenHeight(context) * 0.050,right: ResponsiveHelper.getScreenHeight(context) * 0.050),
              child: GestureDetector(onTap: (){
               Navigator.of(context).pushNamed('/bottomnavbar');
              },child: const CustomButton(title: 'Get Started')),
            ),
            SizedBox(height:ResponsiveHelper.getScreenHeight(context) * 0.040,),
          ],
        ),
      ),
    );
  }
}
