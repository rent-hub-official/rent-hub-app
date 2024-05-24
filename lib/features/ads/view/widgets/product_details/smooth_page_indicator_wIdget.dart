import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/features/ads/controller/product_controller/product_screen_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageIndicatorWIdget extends ConsumerWidget {
  const SmoothPageIndicatorWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: context.spaces.space_400 * 8.5),
        child: SmoothPageIndicator(
          controller: ref.watch(pageController), // PageController
          count: 4,
          effect: WormEffect(
            dotColor: AppColorPalettes.grey200,
            activeDotColor: context.colors.primary,
            dotWidth: context.spaces.space_500,
            dotHeight: context.spaces.space_100 / 2,
          ), // your preferred effect
          onDotClicked: (index) {
            ref.watch(pageController).animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
          },
        ),
      ),
    );
  }
}
