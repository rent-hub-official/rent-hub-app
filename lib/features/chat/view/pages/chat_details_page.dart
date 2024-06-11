import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/authentication/controller/authenticcation_provider/authentication_provider.dart';
import 'package:rent_hub/features/chat/controller/chat_controller.dart';
import 'package:rent_hub/features/chat/view/widgets/input_message_field_widget.dart';
import 'package:rent_hub/features/chat/view/widgets/received_message_widget.dart';
import 'package:rent_hub/features/chat/view/widgets/sent_message_widget.dart';

class ChatDetailsPage extends ConsumerWidget {
  static const routePath = '/chatDetails';
  ChatDetailsPage({super.key, required this.receiverId, required this.userId});

  final TextEditingController inputMessageController = TextEditingController();
  final String userId;
  final String receiverId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: context.spaces.space_500 * 2,
        backgroundColor: context.colors.primary,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: context.spaces.space_200),
              child: RoundedIconButton(
                onTap: () {
                  context.pop();
                },
                icon: Icons.chevron_left_sharp,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO fetch user name and online status
                Text(
                  'amal',
                  style: context.typography.h3Bold,
                ),
                Text(
                  'offline',
                  style: context.typography.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Container(
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
                child: ref.watch(messageSentBymeProvider).when(
                      data: (data) {
                        return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final message = data[index];
                            if (userId == message.senderId &&
                                receiverId == message.receiverId) {
                              log("receivedid${receiverId}");
                              log("eeuirecevedid${message.receiverId}");
                              log("senderid${userId}");
                              log("eeuisenderid${message.senderId}");

                              return SentMessageWidget(
                                message: message.message ?? 'em',
                                time: formatTimestampTo12Hour(message.time),
                              );
                            }
                            return ReceviedMessageWidget(
                              message: message.message ?? '',
                              time: formatTimestampTo12Hour(message.time),
                            );
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
      ),
    );
  }

  String formatTimestampTo12Hour(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    int hour = dateTime.hour;
    int minute = dateTime.minute;

    String period = hour >= 12 ? 'PM' : 'AM';
    hour = hour % 12;
    hour = hour != 0 ? hour : 12; // Convert '0' hour to '12'

    String minuteString = minute < 10 ? '0$minute' : minute.toString();

    return '$hour:$minuteString $period';
  }
}
