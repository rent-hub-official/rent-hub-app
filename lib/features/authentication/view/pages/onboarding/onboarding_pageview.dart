import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/onboarding_constants/onboarding1.dart';
import 'package:rent_hub/core/constants/onboarding_constants/onboarding2.dart';
import 'package:rent_hub/core/constants/onboarding_constants/onboarding3.dart';
import 'package:rent_hub/features/authentication/view/pages/onboarding/onboading_page.dart';

class OnboardingPageview extends ConsumerWidget {
  const OnboardingPageview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants1 = ref.watch(onboarding1Provider);
    final constants2 = ref.watch(onboarding2Provider);
    final constants3 = ref.watch(onboarding3Provider);

    final onboardingPages = [
      OnboardingContent(
        onTap: () {
          pageController.animateToPage(
            1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
        imagePath: "assets/images/img-onboarding1.png",
        heading: constants1.txtHeading,
        subHeading: constants1.txtSubHeading,
        skipText: constants1.txtSkip,
        loaderPath: "assets/images/img-loader1.png",
      ),
      OnboardingContent(
        onTap: () {
          pageController.animateToPage(
            2,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
        imagePath: "assets/images/img-onboarding2.png",
        heading: constants2.txtHeading,
        subHeading: constants2.txtSubHeading,
        skipText: constants2.txtSkip,
        loaderPath: "assets/images/img-loader2.png",
      ),
      OnboardingContent(
        onTap: () {
          pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
        imagePath: "assets/images/img-onboading3.png",
        heading: constants3.txtHeading,
        subHeading: constants3.txtSubHeading,
        skipText: constants3.txtSkip,
        loaderPath: "assets/images/img-loader3.png",
      ),
    ];

    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: onboardingPages.length,
        itemBuilder: (context, index) {
          return OnboardingPage(content: onboardingPages[index]);
        },
      ),
    );
  }
}

final PageController pageController = PageController(initialPage: 0);