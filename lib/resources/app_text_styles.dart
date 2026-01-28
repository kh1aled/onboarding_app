import 'package:birdle/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String grandFontFamily = 'Grand Hotel';
  static const String latofontFamily = 'Lato';


  static const TextStyle heading = TextStyle(
    fontFamily: grandFontFamily,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static const TextStyle subheading = TextStyle(
    fontFamily: latofontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );

  static const TextStyle body = TextStyle(
    fontFamily: latofontFamily,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );
}