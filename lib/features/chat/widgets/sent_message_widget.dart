import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

class SentMessageWidget extends StatelessWidget {
  const SentMessageWidget({
    super.key,
    required this.message,
    required this.time,
    required this.image,
  });
  final String message;
  final String time;
  final String image;
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
        Padding(
          padding: EdgeInsets.only(
              bottom: context.spaces.space_250, left: context.spaces.space_100),
          child: CircleAvatar(
              radius: context.spaces.space_200,
              child: ClipOval(
                child: Image.network(
                  width: double.infinity,
                  height: double.infinity,
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Center(
                    child: Icon(Icons.person),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
