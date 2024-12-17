import 'package:stylish/utils/index.dart';
class CustomButton extends StatelessWidget {
  final String title;
  const CustomButton({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity,height:ResponsiveHelper.getScreenHeight(context) * 0.065,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: AppColors.red),child: Center(child: Text(title,style: TextStyle(fontSize:ResponsiveHelper.getScreenHeight(context) * 0.022,color: AppColors.primary,fontWeight: FontWeight.bold),)),);
  }
}
