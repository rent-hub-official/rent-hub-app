import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/theme/theme_provider.dart';
import 'package:rent_hub/features/authentication/view/pages/splash_screen.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ref.watch(themeProvider),
      home: const SplashScreen(),
      // home: OtpVerificationScreen(),
      // home: Scaffold(
      //   body: SafeArea(
      //     child: Column(
      //       children: [
      //         TextFeildWidget(
      //           labeltxt: 'labeltxt',
      //           hinttxt: 'hinttxt',
      //           textController: TextEditingController(text: 'amal'),
      //           validator: (p0) {
      //             return null;
      //           },
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
