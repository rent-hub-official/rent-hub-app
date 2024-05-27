import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class AppIconButton extends StatelessWidget {
  final Function() onTap;
  final IconData icon;

  final double? radius;
  const AppIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: context.colors.iconButtonBackgroud,
      child: IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            color: context.colors.iconButtonIcon,
          )),
    );
  }
}
