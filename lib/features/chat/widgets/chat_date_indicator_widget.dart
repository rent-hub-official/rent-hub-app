import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

class ChatDateIndicatorWidget extends StatelessWidget {
  final DateTime date;

  const ChatDateIndicatorWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final actualDate = DateTime(date.year, date.month, date.day);

    String label;

    if (actualDate == today) {
      label = 'Today';
    } else if (actualDate == today.subtract(Duration(days: 1))) {
      label = 'Yesterday';
    } else {
      label = DateFormat('dd MMM yyyy').format(date);
    }

    return IntrinsicHeight(
      child: IntrinsicWidth(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: context.spaces.space_100),
          padding: EdgeInsets.symmetric(
            horizontal: context.spaces.space_200,
            vertical: context.spaces.space_100,
          ),
          decoration: BoxDecoration(
            color: context.colors.cardBackground,
            borderRadius: BorderRadius.all(
              Radius.circular(context.spaces.space_400),
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: context.typography.body,
            ),
          ),
        ),
      ),
    );
  }
}
