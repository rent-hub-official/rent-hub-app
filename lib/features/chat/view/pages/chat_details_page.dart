import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/features/chat/widgets/chat_body_widget.dart';

class ChatDetailsPage extends ConsumerWidget {
  static const routePath = '/chatDetails';

  ChatDetailsPage({
    super.key,
    required this.receiverId,
    required this.userImage,
    required this.userName,
  });

  final String receiverId;
  final String userImage;
  final String userName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
            SizedBox(width: context.spaces.space_150),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: context.typography.h3Bold,
                ),
                Text(
                  "Online",
                  style: context.typography.body,
                ),
              ],
            ),
          ],
        ),
      ),
      body: ChatBody(
        receiverId: receiverId,
        recieverImage: userImage,
        recieverName: userName,
      ),
    );
  }
}
