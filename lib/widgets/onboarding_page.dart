import 'package:flutter/material.dart';
import 'package:birdle/constants/app_ui_constants.dart';
import 'package:birdle/resources/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    if (pageIndex < 0 || pageIndex >= AppUiConstants.onboardingPages.length) {
      return const SizedBox();
    }

    final currentPage = AppUiConstants.onboardingPages[pageIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (currentPage.image.isNotEmpty)
          SvgPicture.asset(currentPage.image)
        else
          const SizedBox(),
        const SizedBox(height: 30),

        // Title
        Text(
          currentPage.title,
          style: AppTextStyles.heading,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 10),

        // الوصف
        Text(
          currentPage.description,
          style: AppTextStyles.body,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}
