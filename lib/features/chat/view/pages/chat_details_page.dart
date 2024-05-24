import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/chat_box_constants/chat_box.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/features/chat/view/widgets/received_message_widget.dart';
import 'package:rent_hub/features/chat/view/widgets/sent_message_widget.dart';

class ChatDetailsPage extends ConsumerWidget {
  const ChatDetailsPage({super.key});
  // router path
  final String routerPath = 'ChatDetailsPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        toolbarHeight: context.spaces.space_500 * 2,
        backgroundColor: context.colors.primary,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: context.spaces.space_200),
              // TODO change icon when available
              child: CircleAvatar(
                radius: context.spaces.space_300,
                child: IconButton(
                  icon: Icon(Icons.chevron_left),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: context.typography.h3Bold,
                ),
                Text(
                  'Online',
                  style: context.typography.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
      // chat details section
      body: Container(
        margin: EdgeInsets.only(top: context.spaces.space_100),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: context.colors.cardBackground,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(context.spaces.space_600),
              topRight: Radius.circular(context.spaces.space_600)),
        ),
        child: Padding(
          padding: EdgeInsets.all(context.spaces.space_200),
          child: Column(
            children: [
              const Spacer(),
              ReceviedMessageWidget(),
              SentMessageWidget(),

              /// Textfield for entering messages
              SizedBox(
                height: context.spaces.space_800,
                child: TextField(
                  decoration: InputDecoration(
                    ///add attachment button
                    prefixIcon: Transform.rotate(
                      angle: context.spaces.space_500,
                      child: IconButton(
                        onPressed: () {
                          // TODO share attachments
                        },
                        icon: Icon(
                          color: context.colors.secondary,
                          Icons.attachment,
                          size: context.spaces.space_300,
                        ),
                      ),
                    ),
                    // sent button
                    suffixIcon: Padding(
                      padding: EdgeInsets.all(context.spaces.space_100),
                      child: CircleAvatar(
                        backgroundColor: context.colors.secondary,
                        child: Transform.rotate(
                          angle: context.spaces.space_150,
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: context.spaces.space_50),
                            child: IconButton(
                              onPressed: () {
                                // TODO fucton for sent messsage
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

                    hintText: ref.read(chatBoxConstantsProvider).txtType,
                    hintStyle: context.typography.body,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: context.spaces.space_200),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: context.colors.border),
                      borderRadius:
                          BorderRadius.circular(context.spaces.space_500),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: context.colors.border),
                      borderRadius:
                          BorderRadius.circular(context.spaces.space_500),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
