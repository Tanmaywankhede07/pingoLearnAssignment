import 'package:flutter/material.dart';

abstract class AppColors {
  //Basic colors
  static const colorPrimary = Color(0xff0c54be);

  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF303f60);
  static const background = Color(0xFFf5f9fd);
  static const discountTextColor = Color(0xFFced3dc);

  //Shimmer color
  static const baseLightColor = Color(0xFFF5F5F5);
  static Color highLightColor = Color(0xff0c54be).withOpacity(0.40);
  static const shimmerBackgroundColor = Color(0xFFEAEAEA);
}
