import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent_hub/core/theme/app_theme.dart';


class OnboardingPage extends ConsumerWidget {
  const OnboardingPage({
    super.key,
     required this.imagePath,
     required this.heading,
     required this.subHeading,
     required this.skipText,
     required this.widget,
     required this.onTap,
  });

  final String imagePath;
  final String heading;
  final String subHeading;
  final String skipText;
  final Widget widget;
  final void Function()? onTap;
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
             imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.spaces.space_200),
            child: Text(heading, style: context.typography.h2),
          ),
          SizedBox(
            height: context.spaces.space_100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.spaces.space_200),
            child: Text(
              subHeading,
              style: context.typography.bodyLarge,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(context.spaces.space_200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(skipText),
                IconButton(
                  onPressed: onTap,
                  icon: widget,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
