import 'package:flutter/material.dart';
import 'package:birdle/constants/app_ui_constants.dart';
import 'package:birdle/resources/app_text_styles.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    // تحقق من أن الـ pageIndex داخل الحدود
    if (pageIndex < 0 || pageIndex >= AppUiConstants.onboardingPages.length) {
      return const SizedBox();
    }

    final currentPage = AppUiConstants.onboardingPages[pageIndex];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // الصورة الكبيرة
        Expanded(
          flex: 6,
          child: Image.asset(
            currentPage.image, // افترض إن كل صفحة فيها imagePath
            fit: BoxFit.contain,
          ),
        ),

        const SizedBox(height: 20),

        // العنوان
        Text(
          currentPage.title,
          style: AppTextStyles.heading, // استخدمي ستايل العنوان
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 10),

        // الوصف
        Text(
          currentPage.description,
          style: AppTextStyles.body,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 30), // مسافة من الأسفل
      ],
    );
  }
}
