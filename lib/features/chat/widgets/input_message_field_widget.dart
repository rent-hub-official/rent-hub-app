import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/chat/chat_box.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/features/chat/controller/send_message_controller.dart';
import 'package:rent_hub/features/chat/domain/model/message_model.dart';

class InputMessageFieldWidget extends ConsumerWidget {
  const InputMessageFieldWidget({
    required this.controller,
    required this.senderId,
    required this.receiverId,
    super.key,
  });

  final TextEditingController controller;
  final String senderId;
  final String receiverId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: context.spaces.space_800,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: ref.read(chatBoxConstantsProvider).txtType,
          hintStyle: context.typography.body,
          contentPadding:
              EdgeInsets.symmetric(vertical: context.spaces.space_200),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.colors.border),
            borderRadius: BorderRadius.circular(context.spaces.space_500),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: context.colors.border),
            borderRadius: BorderRadius.circular(context.spaces.space_500),
          ),
          prefix: SizedBox(
            width: context.spaces.space_200,
          ),

          ///add attachment button

          // sent button
          suffixIcon: Padding(
            padding: EdgeInsets.all(context.spaces.space_100),
            child: CircleAvatar(
              backgroundColor: context.colors.secondary,
              child: Transform.rotate(
                angle: context.spaces.space_150,
                child: Padding(
                  padding: EdgeInsets.only(left: context.spaces.space_50),
                  child: IconButton(
                    onPressed: () {
                      controller.text.isEmpty
                          ? null
                          : ref
                              .watch(sendMessageControllerProvider.notifier)
                              .sendMessage(
                                message: MessageModel(
                                  message: controller.text,
                                  time: Timestamp.now(),
                                  senderId: senderId,
                                  receiverId: receiverId,
                                  isRead: false,
                                  isReceived: false,
                                ),
                              );
                      // TODO fucton for sent messsage
                      controller.clear();
                    },
                    icon: Icon(
                      Icons.send,
                      color: context.colors.primary,
                      size: context.spaces.space_250,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
