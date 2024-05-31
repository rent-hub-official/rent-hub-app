import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(
            flex: 3,
          ),
          SizedBox(
            height: context.spaces.space_600 * 8,
            width: double.infinity,
            child: SvgPicture.asset(
              content.imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.spaces.space_200),
            child: Text(content.heading, style: context.typography.h2),
          ),
          SizedBox(
            height: context.spaces.space_100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.spaces.space_200),
            child: Text(
              content.subHeading,
              style: context.typography.bodyLarge,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(context.spaces.space_200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(content.skipText),
                IconButton(
                  onPressed: content.onTap,
                  icon: content.widget,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
