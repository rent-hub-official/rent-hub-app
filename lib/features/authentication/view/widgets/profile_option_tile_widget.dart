import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class ProfileOptionTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? subtitle;
  final VoidCallback onTap;

  ProfileOptionTile({
    required this.icon,
    required this.text,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: context.spaces.space_300,
      ),
      title: Text(
        text,
        style: context.typography.bodyLarge,
      ),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: onTap,
    );
  }
}
