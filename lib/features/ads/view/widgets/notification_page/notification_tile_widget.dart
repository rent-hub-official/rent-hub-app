import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class NotificationTileWidget extends StatelessWidget {
  const NotificationTileWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colors.cardBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: context.colors.border),
      ),
      shadowColor: context.colors.border,
      child: ListTile(
        title: Text(title, style: context.typography.bodySemibold),
        subtitle: Text(
          subTitle,
          style: context.typography.bodySmall,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
