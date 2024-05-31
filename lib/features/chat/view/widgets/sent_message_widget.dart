import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class SentMessageWidget extends StatelessWidget {
  const SentMessageWidget(
      {super.key, required this.message, required this.time});
  final String message;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(context.spaces.space_200),
              width: max(0, context.spaces.space_900 * 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(context.spaces.space_600),
                      topLeft: Radius.circular(context.spaces.space_600),
                      topRight: Radius.circular(context.spaces.space_600)),
                  color: context.colors.messageBackground),
              // message
              child: Text(message, style: context.typography.body),
            ),
            // sent message time
            Text(time, style: context.typography.bodySmall)
          ],
        ),
        // TODO add sender profile image
        Padding(
          padding: EdgeInsets.only(
              bottom: context.spaces.space_250, left: context.spaces.space_100),
          child: CircleAvatar(
            radius: context.spaces.space_200,
          ),
        ),
      ],
    );
  }
}
