import 'package:flutter/widgets.dart';

class SizeConfig {
  static double screenWidth = 0;
  static double scaleFactor = 0;
  

  static void init(BuildContext context) {
     final orientation = MediaQuery.of(context).orientation;
 screenWidth = MediaQuery.of(context).size.width;
     if(orientation == Orientation.portrait){
      print('Portrait');
      scaleFactor =    screenWidth / 360;
     }else{
        print('Landscape');
      scaleFactor = screenWidth / 640; //screenWidth / 360; // Adjust as needed based on your design
     }

   
  
  }

  static double getScaledFontSize(double baseFontSize) {
    return baseFontSize * scaleFactor;
  }

  static double getIconSize(double iconSize) {
    // return screenWidth < 600 ? iconSize : 46; // Smaller on mobile, larger on desktop
   return iconSize * scaleFactor;
  }

  static double getBottomNavHeight(double bottomNavHeight) {
     return bottomNavHeight * scaleFactor;
  }

  
  // static double get iconSize {
  //   return screenWidth < 600 ? iconSize : 46; // Smaller on mobile, larger on desktop
  // }

  // static double get bottomNavHeight {
  //   //return screenWidth < 600 ? 56 : 100; // Smaller height on mobile, larger on desktop
  // }
}
