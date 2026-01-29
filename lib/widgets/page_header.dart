import 'package:flutter/material.dart';
import 'package:birdle/common_widgets/app_rich_text.dart';
import 'package:birdle/constants/app_ui_constants.dart';
import 'package:birdle/resources/app_text_styles.dart';

import '../resources/app_colors.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppRichText(
          originalText: '${pageIndex + 1}',
          highlightedText: '/${AppUiConstants.onboardingPages.length}',
          originalTextStyle: AppTextStyles.body,
          highlightedTextStyle: AppTextStyles.body.copyWith(
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}