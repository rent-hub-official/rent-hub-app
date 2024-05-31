import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/features/authentication/view/pages/onboarding/onboarding_pages.dart';

class SplashPage extends ConsumerWidget {
  static const routePath = "/";
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(child: Text('knkn')),
      // SvgPicture.asset(ref.watch(imageConstantsProvider).imgLogo)),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_circle_right_outlined),
          onPressed: () {
            context.push(OnboardingPages.routePath);
          }),
    );
  }
}
