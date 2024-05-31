import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/features/chat/view/pages/seller_profile_page.dart';

class ReceviedMessageWidget extends StatelessWidget {
  const ReceviedMessageWidget(
      {super.key, required this.message, required this.time});
  final String message;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 100,
                  bottom: context.spaces.space_250,
                  right: context.spaces.space_100),
              child: InkWell(
                  onTap: () {
                    //TODO navigate to show sender profile
                    // TODO add seller profile photo
                    context.push(SellerProfilePage.routePath);
                  },
                  child: CircleAvatar(
                    radius: context.spaces.space_200,
                  )),
            ),
          ],
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
                  color: context.colors.messageBackground),
              // recevied message
              child: Text(message, style: context.typography.body),
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
