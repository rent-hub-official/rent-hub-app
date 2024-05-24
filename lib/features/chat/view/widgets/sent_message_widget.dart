import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class SentMessageWidget extends StatelessWidget {
  const SentMessageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
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
                  color: Colors.red),
              child: const Text(
                  ' Lorem Ipsum is simply dummy text of the printing and typesetting industry.Ipsum is simply dummy text of the printing and typesetting industry'),
            ),
            const Text('2:00')
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: context.spaces.space_250, left: context.spaces.space_150),
          child: CircleAvatar(
            radius: context.spaces.space_300,
          ),
        ),
      ],
    );
  }
}
