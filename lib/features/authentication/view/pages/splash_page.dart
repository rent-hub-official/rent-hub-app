import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const routePath = "/splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Image(
        image: AssetImage("assets/images/rent_logo.png"),
        width: 150,
        height: 150,
      )),
    );
  }
}
