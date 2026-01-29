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

  static const TextStyle subheading = TextStyle(
    fontFamily: latofontFamily,
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: AppColors.blackColor,
  );

  static const TextStyle body = TextStyle(
    fontFamily: latofontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );
}