import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/features/ads/controller/user_controller/user_data_provider.dart';

class SentMessageWidget extends ConsumerWidget {
  const SentMessageWidget({
    super.key,
    required this.message,
    required this.time,
  });

  final String message;
  final String time;

  @override
  Widget build(BuildContext context, ref) {
    final currentUserDetails = ref.watch(
      GetUserDataProvider(FirebaseAuth.instance.currentUser!.phoneNumber!),
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(context.spaces.space_150),

              width: max(0, context.spaces.space_900 * 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(context.spaces.space_200),
                      topLeft: Radius.circular(context.spaces.space_200),
                      topRight: Radius.circular(context.spaces.space_200)),
                  color: context.colors.messageBackground),
              // message
              child: Padding(
                padding: EdgeInsets.all(context.spaces.space_100),
                child: Text(message, style: context.typography.body),
              ),
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
                child: switch (currentUserDetails) {
                  AsyncData(value: final userDetails) => Image.network(
                      width: double.infinity,
                      height: double.infinity,
                      userDetails.profileImage,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Center(
                        child: Icon(Icons.person),
                      ),
                    ),
                  _ => Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: context.colors.bottomNavBorder,
                    )
                },
              )),
        ),
      ],
    );
  }
}
