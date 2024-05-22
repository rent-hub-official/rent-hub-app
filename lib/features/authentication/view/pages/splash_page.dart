import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/image_constants.dart';

class SplashScreen extends ConsumerWidget {
  static const routePath = "/splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
          child: Image(
        image: AssetImage(ref.watch(imageConstantsProvider).imgLogo),
        width: 150,
        height: 150,
      )),
    );
  }
}
