import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rent_hub/core/constants/image_constants.dart';

class SplashPage extends ConsumerWidget {
  static const routePath = "/splashpage";
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
          child: SvgPicture.asset(ref.watch(imageConstantsProvider).imgLogo)),
    );
  }
}
