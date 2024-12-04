import 'package:flutter/widgets.dart';

class ResponsiveHelper {
// Get screen height 
 static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Get screen height
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
