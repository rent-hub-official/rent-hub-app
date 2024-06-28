import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/chat/chat_box.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/features/authentication/controller/authenticcation_provider/authentication_provider.dart';
import 'package:rent_hub/features/chat/controller/get_all_user_conroller.dart';
import 'package:rent_hub/features/chat/view/pages/chat_details_page.dart';

class ChatListPage extends ConsumerWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserId = ref.watch(authenticationProvider).phoneNumber;
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        backgroundColor: context.colors.primary,
        title: Consumer(
          builder: (context, ref, child) {
            return Text(
              ref.watch(chatBoxConstantsProvider).txtHeading,
              style: context.typography.h1Bold,
            );
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: context.colors.cardBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(context.spaces.space_600),
            topRight: Radius.circular(context.spaces.space_600),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(context.spaces.space_100),
          child: Column(
            children: [
              SizedBox(
                height: context.spaces.space_200,
              ),
              ref.watch(getAllUserProvider).when(
                    data: (data) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.docs.length,
                        itemBuilder: (context, index) {
                          final doc = data.docs[index];

                          return currentUserId != doc.id
                              ? Stack(
                                  children: [
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            context.spaces.space_300),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListTile(
                                          onTap: () {
                                            final image =
                                                doc.data().profileImage;
                                            final name = doc.data().userName;
                                            final receiverId = doc.id;
                                            final userId = currentUserId!;
                                            context.push(
                                              ChatDetailsPage.routePath,
                                              extra: {
                                                'image': image,
                                                'name': name,
                                                'receiverId': receiverId,
                                                'userId': userId,
                                              },
                                            );
                                          },
                                          leading: CircleAvatar(
                                              maxRadius: 24,
                                              // Placeholder background color
                                              child: Image.network(
                                                doc.data().profileImage,
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Center(
                                                  child: Icon(Icons.person),
                                                ),
                                              )
                                              // Placeholder icon if no profile image URL
                                              ),
                                          title: Text(
                                            doc.data().userName,
                                            style: context
                                                .typography.bodyLargeSemiBold,
                                          ),
                                        ),
                                      ),
                                      color: context.colors.messageBackground,
                                    ),
                                  ],
                                )
                              : SizedBox.shrink();
                        },
                      );
                    },
                    error: (error, stackTrace) => Center(
                      child: Text(error.toString()),
                    ),
                    loading: () => CircularProgressIndicator(),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
