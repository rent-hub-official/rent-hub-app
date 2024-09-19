import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

class securityWidget extends StatelessWidget {
  const securityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.spaces.space_500,
      height: context.spaces.space_500,
      child: Center(
        child: Icon(
          Icons.verified_user_outlined,
          size: context.spaces.space_300,
        ),
      ),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: context.colors.primary),
    );
  }
}
