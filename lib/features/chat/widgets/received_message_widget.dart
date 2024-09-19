import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

class ReceviedMessageWidget extends StatelessWidget {
  const ReceviedMessageWidget({
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
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: context.spaces.space_250,
                  right: context.spaces.space_100),
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
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: max(0, context.spaces.space_900 * 3),
              padding: EdgeInsets.all(context.spaces.space_150),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(context.spaces.space_200),
                      topLeft: Radius.circular(context.spaces.space_200),
                      topRight: Radius.circular(context.spaces.space_200)),
                  color: context.colors.messageBackground),
              // recevied message
              child: Padding(
                padding: EdgeInsets.all(context.spaces.space_100),
                child: Text(message, style: context.typography.body),
              ),
            ),
            // recevied message time
            Text(
              time,
              style: context.typography.bodySmall,
            )
          ],
        )
      ],
    );
  }
}
