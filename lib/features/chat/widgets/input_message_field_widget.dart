import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/chat/chat_box.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/features/chat/controller/send_message_controller.dart';
import 'package:rent_hub/features/chat/domain/model/message_model.dart';
import 'package:rent_hub/features/chat/view/pages/chat_details_page.dart';
import 'package:rent_hub/features/notification/controller/get_fcm_token_controller.dart';
import 'package:rent_hub/features/notification/controller/send_notification_controller.dart';
import 'package:rent_hub/features/notification/domain/model/send_notification_model/payload.dart';
import 'package:rent_hub/features/notification/domain/model/send_notification_model/router_state.dart';
import 'package:rent_hub/features/notification/domain/model/send_notification_model/send_notification_model.dart';

class InputMessageFieldWidget extends ConsumerWidget {
  const InputMessageFieldWidget({
    required this.controller,
    required this.senderId,
    required this.receiverId,
    required this.img,
    required this.name,
    super.key,
  });

  final TextEditingController controller;
  final String senderId;
  final String receiverId;
  final String img;
  final String name;

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
                    onPressed: () async {
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
                      final fcm = await ref
                          .read(fcmTokenProvider.notifier)
                          .getFcmTokenFromDb(
                            id: receiverId,
                          );

                      ref
                          .read(sendNotificationControllerProvider.notifier)
                          .sendNotification(
                            fcmToken: fcm.data()!.fcmToken!,
                            sendNotification: SendNotificationModel(
                              title: name,
                              body: controller.text,
                              payload: Payload(
                                  routerPath: ChatDetailsPage.routePath,
                                  routerState: RouterState(
                                    image: img,
                                    name: name,
                                    receiverId: receiverId,
                                    userId: senderId,
                                  )),
                            ),
                          );
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
