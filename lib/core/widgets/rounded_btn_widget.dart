import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

class RoundedIconButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? radius;

  const RoundedIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.backgroundColor,
    this.iconColor,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? context.colors.iconButtonBackgroud,
      child: Material(
        borderRadius: radius != null ? BorderRadius.circular(radius!) : null,
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          customBorder: CircleBorder(),
          child: Center(
            child: Icon(
              icon,
              color: iconColor ?? context.colors.iconButtonIcon,
            ),
          ),
        ),
      ),
    );
  }
}
