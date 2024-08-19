import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/chat/chat_box.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/search_field_widget.dart';
import 'package:rent_hub/features/chat/controller/get_all_user_conroller.dart';
import 'package:rent_hub/features/chat/view/pages/chat_details_page.dart';

class ChatListPage extends HookConsumerWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final isSearchVisible = useState(false);
    final searchFieldHeight = useState(0.0);
    final searchFieldOpacity = useState(0.0);

    final currentUserId = FirebaseAuth.instance.currentUser!.phoneNumber;

    /// Open the search panel
    void openSearchField() {
      isSearchVisible.value = true;

      searchFieldOpacity.value = 1;
      searchFieldHeight.value = 56;
    }

    /// Close the search field
    void closeSearchField() {
      isSearchVisible.value = false;

      searchFieldOpacity.value = 0;
      searchFieldHeight.value = 0;
    }

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: context.colors.primary,
        title: Consumer(
          builder: (context, ref, child) {
            return Text(
              ref.watch(chatBoxConstantsProvider).txtHeading,
              style: context.typography.h3SemiBold,
            );
          },
        ),
        actions: [
          RoundedIconButton(
            onTap: () {
              if (isSearchVisible.value) {
                closeSearchField();
              } else {
                openSearchField();
              }
            },
            icon: Icons.search,
          ),
          SizedBox(
            width: context.spaces.space_200,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.spaces.space_200,
                vertical: context.spaces.space_100),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 100),
              opacity: searchFieldOpacity.value,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                height: searchFieldHeight.value,
                child: isSearchVisible.value
                    ? SearchFieldWidget(
                        hintText: 'Search...',
                        controller: searchController,
                      )
                    : SizedBox(),
              ),
            ),
          ),

          /// Listview
          ref.watch(getAllUserProvider).when(
                data: (data) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final doc = data[index];

                      return currentUserId != doc.userId
                          ? Card(
                              child: ListTile(
                                onTap: () {
                                  final image = doc.profileImage;
                                  final name = doc.userName;
                                  final receiverId = doc.userId;
                                  final userId = currentUserId;
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
                                    child: ClipOval(
                                      child: Image.network(
                                        width: double.infinity,
                                        height: double.infinity,
                                        doc.profileImage,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Center(
                                          child: Icon(Icons.person),
                                        ),
                                      ),
                                    )
                                    // Placeholder icon if no profile image URL
                                    ),
                                title: Text(
                                  doc.userName,
                                ),
                              ),
                              color: Colors.transparent,
                              shadowColor: Colors.transparent,
                            )
                          : SizedBox.shrink();
                    },
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Column(
                    children: [
                      Text("Reload"),
                      IconButton(
                          onPressed: () {
                            ref.invalidate(getAllUserProvider);
                          },
                          icon: Icon(Icons.refresh))
                    ],
                  ),
                ),
                loading: () => Expanded(
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
        ],
      ),
    );
  }
}
