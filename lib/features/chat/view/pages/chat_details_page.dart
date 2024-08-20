import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/features/chat/widgets/chat_body_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/ads/controller/user_controller/user_data_provider.dart';

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
    final userDataAsyncValue = ref.watch(getUserDataProvider(userId));

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
      body: userDataAsyncValue.when(
        data: (userData) {
          return ChatBody(
            profileImage: userData.profileImage,
            name: ref.watch(getUserDataProvider(userId)).value!.userName,
            userId: userId,
            receiverId: receiverId,
            image: image,
            inputMessageController: inputMessageController,
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            children: [
              Text("Reload"),
              IconButton(
                  onPressed: () {
                    ref.invalidate(getUserDataProvider(userId));
                  },
                  icon: Icon(Icons.refresh))
            ],
          ),
        ),
      ),
    );
  }
}
