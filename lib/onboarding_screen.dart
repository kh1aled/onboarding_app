import 'package:flutter/material.dart';
import 'package:birdle/resources/app_colors.dart';
import 'package:birdle/constants/app_ui_constants.dart';
import 'package:birdle/widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int pageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Go to the next page or navigate to main screen if it's the last page
  void nextPage() {
    if (pageIndex < AppUiConstants.onboardingPages.length - 1) {
      _pageController.animateToPage(
        pageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      navigateToMainScreen();
    }
  }

  // Skip to the last page
  void skipToEnd() {
    _pageController.animateToPage(
      AppUiConstants.onboardingPages.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Navigate to main screen (replace with your main screen route)
  void navigateToMainScreen() {
    // Example: Navigator.pushReplacementNamed(context, '/home');
    // print("Navigate to main screen"); // Replace with actual navigation
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = pageIndex == AppUiConstants.onboardingPages.length - 1;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // The onboarding page content (takes full space) - KEEPING YOUR OLD DESIGN
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: AppUiConstants.onboardingPages.length,
                onPageChanged: (index) {
                  setState(() => pageIndex = index);
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(pageIndex: index);
                },
              ),
            ),

            // NEW FOOTER DESIGN ONLY
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
              child: Column(
                children: [
                  // Page indicators (dots) - NEW DESIGN
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      AppUiConstants.onboardingPages.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: index == pageIndex ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: index == pageIndex
                              ? AppColors.primaryColor
                              : AppColors.primaryColor.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Navigation buttons - NEW DESIGN
                  if (!isLastPage)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Skip button
                        TextButton(
                          onPressed: skipToEnd,
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.blackColor,
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          child: const Text('Skip'),
                        ),

                        // Next button
                        TextButton(
                          onPressed: nextPage,
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.blackColor,
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          child: const Text('Next'),
                        ),
                      ],
                    ),

                  // Get Started button (only on last page) - NEW DESIGN
                  if (isLastPage)
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: navigateToMainScreen,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        child: const Text('Get Started'),
                      ),
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