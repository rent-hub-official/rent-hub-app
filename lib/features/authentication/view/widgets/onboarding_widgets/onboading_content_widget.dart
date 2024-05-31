// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:rent_hub/core/theme/app_theme.dart';

// class OnboardingContentWidget {
//   final String imagePath;
//   final String heading;
//   final String subHeading;
//   final String skipText;

//   final Widget widget;
//   final void Function()? onTap;

//   OnboardingContentWidget({
//     required this.widget,
//     required this.onTap,
//     required this.imagePath,
//     required this.heading,
//     required this.subHeading,
//     required this.skipText,
//   });
// }

// class OnboardingPage extends ConsumerWidget {
//   final OnboardingContentWidget content;

//   const OnboardingPage({
//     super.key,
//     required this.content,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(top: context.spaces.space_800 * 2),
//               child: Expanded(
//                 child: SizedBox(
//                   height: context.spaces.space_600 * 8,
//                   width: double.infinity,
//                   child: SvgPicture.asset(
//                     content.imagePath,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(
//                 top: context.spaces.space_100,
//                 left: context.spaces.space_200,
//                 right: context.spaces.space_200,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.only(
//                         top: context.spaces.space_900 +
//                             context.spaces.space_200),
//                     child: Text(content.heading, style: context.typography.h2),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: context.spaces.space_100),
//                     child: Text(
//                       content.subHeading,
//                       style: context.typography.bodyLarge,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         vertical: context.spaces.space_100),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(content.skipText),
//                         IconButton(
//                             onPressed: content.onTap, icon: content.widget),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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
          // Padding(
          //   padding: EdgeInsets.only(
          //     left: context.spaces.space_200,
          //     right: context.spaces.space_200,
          //   ),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
