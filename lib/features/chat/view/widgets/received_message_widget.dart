import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class ReceviedMessageWidget extends StatelessWidget {
  const ReceviedMessageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(
              bottom: context.spaces.space_250,
              right: context.spaces.space_150),
          child: InkWell(
              onTap: () {
                //TODO navigate to show sender profile
              },
              child: CircleAvatar()),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: max(0, context.spaces.space_900 * 3),
              padding: EdgeInsets.all(context.spaces.space_250),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(context.spaces.space_600),
                      topLeft: Radius.circular(context.spaces.space_600),
                      topRight: Radius.circular(context.spaces.space_600)),
                  color: Colors.red),
              child: const Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
            ),
            const Text('2:00')
          ],
        )
      ],
    );
  }
}
