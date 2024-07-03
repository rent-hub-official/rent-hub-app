
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/constants/icon_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/authentication/controller/account_details_provider/account_details_provider.dart';
import 'package:rent_hub/features/authentication/controller/authenticcation_provider/authentication_provider.dart';
import 'package:rent_hub/features/chat/controller/format_time_controller.dart';
import 'package:rent_hub/features/chat/controller/get_all_chat_controller.dart';
import 'package:rent_hub/features/chat/view/widgets/input_message_field_widget.dart';
import 'package:rent_hub/features/chat/view/widgets/received_message_widget.dart';
import 'package:rent_hub/features/chat/view/widgets/sent_message_widget.dart';

class ChatDetailsPage extends ConsumerWidget {
  static const routePath = '/chatDetails';
  ChatDetailsPage({
    super.key,
    required this.receiverId,
    required this.userId,
    required this.image,
    required this.name,
  });

  final TextEditingController inputMessageController = TextEditingController();
  final String userId;
  final String receiverId;
  final String image;
  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileImage = ref
            .watch(GetAccountDetailsProvider(
              userId: userId,
            ))
            .value
            ?.data()
            ?.profileImage ??
        ref.watch(iconConstantsProvider).icProfile;
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
                Text(
                  name,
                  style: context.typography.h3Bold,
                ),
                Text(
                  '',
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
                child: ref.watch(getAllMessageProvider).when(
                      data: (data) {
                        return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final message = data[index];
                            if (userId == message.senderId) {
                              return SentMessageWidget(
                                image: profileImage,
                                message: message.message ?? 'emjjj',
                                time: ref.watch(FormatTimeProvider(
                                    timestamp: message.time)),
                              );
                            }
                            return ReceviedMessageWidget(
                              image: image,
                              message: message.message ?? '',
                              time: ref.watch(
                                  FormatTimeProvider(timestamp: message.time)),
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
}
