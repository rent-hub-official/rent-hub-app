import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class ProfileSettingsFieldWidget extends StatelessWidget {
  const ProfileSettingsFieldWidget({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.spaces.space_400),
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: context.typography.bodyLarge,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                ),
              ],
            ),
            Divider(color: context.colors.border, thickness: 0.6),
          ],
        ),
      ),
    );
  }
}
