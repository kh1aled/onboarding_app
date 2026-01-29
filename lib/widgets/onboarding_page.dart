import 'package:birdle/resources/app_images.dart';
import 'package:flutter/material.dart';
import 'package:birdle/constants/app_ui_constants.dart';
import 'package:birdle/resources/app_text_styles.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    if (pageIndex < 0 || pageIndex >= AppUiConstants.onboardingPages.length) {
      return const SizedBox();
    }

    final currentPage = AppUiConstants.onboardingPages[pageIndex];
    final ellipseConfig = _getEllipseConfig(pageIndex);

    return Stack(
      children: [
        // Ellipse background with custom position and size - YOUR OLD DESIGN
        Positioned(
          top: ellipseConfig.top,
          right: ellipseConfig.right,
          left: ellipseConfig.left,
          bottom: ellipseConfig.bottom,
          child: Image.asset(
            ellipseConfig.image,
            width: ellipseConfig.width,
            height: ellipseConfig.height,
            fit: BoxFit.contain,
          ),
        ),
        // Main content - YOUR OLD DESIGN
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(currentPage.image),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                currentPage.title,
                style: AppTextStyles.heading,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                currentPage.description,
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ],
    );
  }

  EllipseConfig _getEllipseConfig(int index) {
    switch (index) {
      case 0:
        return EllipseConfig(
          image: AppImages.ellipseImage1,
          top: 0,
          right: -125,
          width: 481,
          height: 481,
        );
      case 1:
        return EllipseConfig(
          image: AppImages.ellipseImage2,
          top: 0,
          left: -125,
          width: 481,
          height: 481,
        );
      case 2:
        return EllipseConfig(
          image: AppImages.ellipseImage3,
          top: 10,
          left: 0,
          right: 0,
          width: double.infinity,
          height: 400,
        );
      default:
        return EllipseConfig(
          image: AppImages.ellipseImage1,
          top: 0,
          right: -125,
          width: 481,
          height: 481,
        );
    }
  }
}

// Helper class to hold ellipse configuration
class EllipseConfig {
  final String image;
  final double? top;
  final double? right;
  final double? left;
  final double? bottom;
  final double width;
  final double height;

  EllipseConfig({
    required this.image,
    this.top,
    this.right,
    this.left,
    this.bottom,
    required this.width,
    required this.height,
  });
}