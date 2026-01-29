import 'package:birdle/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String grandFontFamily = 'GrandHotel';
  static const String latofontFamily = 'Lato';

  static const TextStyle heading = TextStyle(
    fontFamily: grandFontFamily,
    fontSize: 40,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryColor,
  );

  // Body text style for descriptions
  static const TextStyle body = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
    fontFamily: 'Lato',
    height: 1.5,
  );

  // Button text style
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Lato',
  );

  // Small text style
  static const TextStyle caption = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryTextColor,
    fontFamily: 'Lato',
  );
}
