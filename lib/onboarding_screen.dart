// lib/screens/onboarding_screen.dart
import 'package:birdle/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:birdle/constants/app_ui_constants.dart';
import 'package:birdle/widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int pageIndex = 0;

  // Go to the next page or navigate to main screen if it's the last page
  void nextPage() {
    if (pageIndex < AppUiConstants.onboardingPages.length - 1) {
      setState(() => pageIndex++);
    } else {
      navigateToMainScreen();
    }
  }

  // Go to the previous page
  void prevPage() {
    if (pageIndex > 0) {
      setState(() => pageIndex--);
    }
  }

  // Navigate to main screen (replace with your main screen route)
  void navigateToMainScreen() {
    // Example: Navigator.pushReplacementNamed(context, '/home');
    // print("Navigate to main screen"); // Replace with actual navigation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // The onboarding page content (takes full space)
            Expanded(
              child: OnboardingPage(pageIndex: pageIndex),
            ),

            // Dots indicators and navigation buttons with padding
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Previous button, disabled on first page
                  TextButton(
                    onPressed: pageIndex > 0 ? prevPage : null,
                    child: const Text('Prev'),
                  ),

                  // Page indicators (dots)
                  Row(
                    children: List.generate(
                      AppUiConstants.onboardingPages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == pageIndex
                              ? AppColors.primaryColor
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),

                  // Next or Start button
                  TextButton(
                    onPressed: nextPage,
                    child: Text(pageIndex ==
                            AppUiConstants.onboardingPages.length - 1
                        ? 'Start'
                        : 'Next'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}