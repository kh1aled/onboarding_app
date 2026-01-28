import 'package:birdle/resources/app_images.dart';
import 'package:birdle/ui_model/page_model.dart';

class AppUiConstants {
  static final List<PageModel> onboardingPages = [
    PageModel(
      title: 'Practice Mindfulness',
      description: 'Get started with Yoga',
      image: AppImages.onboardingImage1,
    ),
    PageModel(
      title: 'Get started with Yoga',
      description: 'Easily get started with your yoga journey',
      image: AppImages.onboardingImage2,
    ),
    PageModel(
      title: 'Unplug your life',
      description: 'Set up different measures to start with your life',
      image: AppImages.onboardingImage3,
    ),
  ];
}