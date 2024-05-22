import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class OnboardingContent {
  final String imagePath;
  final String heading;
  final String subHeading;
  final String skipText;

  final Widget widget;
  final void Function()? onTap;

  OnboardingContent({
    required this.widget,
    required this.onTap,
    required this.imagePath,
    required this.heading,
    required this.subHeading,
    required this.skipText,
  });
}

class OnboardingPage extends ConsumerWidget {
  final OnboardingContent content;

  const OnboardingPage({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(top: context.spaces.space_800 * 2),
              child: Expanded(
                child: Container(
                  height: context.spaces.space_900 + context.spaces.space_250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(content.imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: context.spaces.space_100,
                left: context.spaces.space_200,
                right: context.spaces.space_200,
                bottom: context.spaces.space_400,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: context.spaces.space_900 +
                            context.spaces.space_200),
                    child: Text(content.heading, style: context.typography.h2),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: context.spaces.space_250),
                    child: Text(
                      content.subHeading,
                      style: context.typography.bodyLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: context.spaces.space_400),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(content.skipText),
                        IconButton(
                            onPressed: content.onTap, icon: content.widget),
                      ],
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
