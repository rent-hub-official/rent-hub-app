import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/features/authentication/controller/authenticcation_provider/authentication_provider.dart';
import 'package:rent_hub/features/chat/controller/format_time_controller.dart';
import 'package:rent_hub/features/chat/controller/get_all_chat_controller.dart';
import 'package:rent_hub/features/chat/widgets/input_message_field_widget.dart';
import 'package:rent_hub/features/chat/widgets/received_message_widget.dart';
import 'package:rent_hub/features/chat/widgets/sent_message_widget.dart';

class ChatBody extends ConsumerWidget {
  const ChatBody({
    Key? key,
    required this.profileImage,
    required this.userId,
    required this.receiverId,
    required this.image,
    required this.inputMessageController,
  }) : super(key: key);

  final String profileImage;
  final String userId;
  final String receiverId;
  final String image;
  final TextEditingController inputMessageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(top: context.spaces.space_100),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: context.colors.cardBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.spaces.space_600),
          topRight: Radius.circular(context.spaces.space_600),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(context.spaces.space_200),
        child: Column(
          children: [
            Expanded(
              child: ref.watch(getAllMessageProvider).when(
                    data: (data) {
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final message = data[index];
                          log("Passing receive ID $userId");
                          log("This page receive ID ${message.receiverId}");
                          if (userId == message.senderId &&
                              receiverId == message.receiverId) {
                            return SentMessageWidget(
                              image: profileImage,
                              message: message.message ?? '',
                              time: ref.watch(
                                  FormatTimeProvider(timestamp: message.time)),
                            );
                          } else if (userId == message.receiverId &&
                              receiverId == message.senderId) {
                            return ReceviedMessageWidget(
                              image: image,
                              message: message.message ?? '',
                              time: ref.watch(
                                  FormatTimeProvider(timestamp: message.time)),
                            );
                          }
                          return SizedBox.shrink();
                        },
                      );
                    },
                    error: (error, stackTrace) => Center(
                      child: Text(error.toString()),
                    ),
                    loading: () => Center(child: CircularProgressIndicator()),
                  ),
            ),
            InputMessageFieldWidget(
              receiverId: receiverId,
              senderId: ref.watch(authenticationProvider).phoneNumber!,
              controller: inputMessageController,
            ),
          ],
        ),
      ),
    );
  }
}
