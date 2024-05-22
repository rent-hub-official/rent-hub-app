import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/image_constants.dart';
import 'package:rent_hub/core/constants/onboarding_constants/onboarding1.dart';
import 'package:rent_hub/core/constants/onboarding_constants/onboarding2.dart';
import 'package:rent_hub/core/constants/onboarding_constants/onboarding3.dart';
import 'package:rent_hub/features/authentication/view/pages/onboarding/onboading_page.dart';
import 'package:rent_hub/features/authentication/view/widgets/onboarding_widgets/loder_widget.dart';

class OnboardingPageview extends ConsumerWidget {
  const OnboardingPageview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants1 = ref.watch(onboarding1Provider);
    final constants2 = ref.watch(onboarding2Provider);
    final constants3 = ref.watch(onboarding3Provider);
    final image = ref.watch(imageConstantsProvider);

    final onboardingPages = [
      OnboardingContent(
        onTap: () {
          pageController.animateToPage(
            1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
        imagePath: image.imgOnboarding1,
        heading: constants1.txtHeading,
        subHeading: constants1.txtSubHeading,
        skipText: constants1.txtSkip,
        widget: CircularProgressBar(
          progress: 0.5,
        ),
      ),
      OnboardingContent(
        widget: CircularProgressBar(
          progress: 0.75,
        ),
        onTap: () {
          pageController.animateToPage(
            2,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
        imagePath: image.imgOnboarding2,
        heading: constants2.txtHeading,
        subHeading: constants2.txtSubHeading,
        skipText: constants2.txtSkip,
      ),
      OnboardingContent(
        widget: CircularProgressBar(
          progress: 1,
        ),
        onTap: () {
          pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.linear,
          );
        },
        imagePath: image.imgOnboarding3,
        heading: constants3.txtHeading,
        subHeading: constants3.txtSubHeading,
        skipText: constants3.txtSkip,
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
