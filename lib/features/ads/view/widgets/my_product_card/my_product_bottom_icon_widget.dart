import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class MyProductBottomIconTextWidget extends StatelessWidget {
  const MyProductBottomIconTextWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // icon
        Icon(
          icon,
          size: context.spaces.space_200,
        ),
        // width spacer
        SizedBox(
          width: context.spaces.space_50,
        ),
        // text
        Text(
          text,
          style: context.typography.bodySemibold,
        )
      ],
    );
  }
}
