import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class NotificationTileWidget extends StatelessWidget {
  const NotificationTileWidget({
    super.key,
  });

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
        title: Text('Lorem Ipsum',
            style: context.typography.bodySemibold),
        subtitle: Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type',
          style: context.typography.bodySmall,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
