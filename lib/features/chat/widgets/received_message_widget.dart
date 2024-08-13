import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/features/chat/view/pages/seller_profile_page.dart';

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
              child: InkWell(
                  onTap: () {
                    context.push(SellerProfilePage.routePath);
                  },
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
                      ))),
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
