import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

class RoundedIconButton extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? radius;

  const RoundedIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.backgroundColor,
    this.radius,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor ?? context.colors.iconButtonBackgroud,
      child: IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            color: iconColor ?? context.colors.iconButtonIcon,
          )),
    );
  }
}
