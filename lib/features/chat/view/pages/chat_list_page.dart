import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/chat/chat_box.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/search_field_widget.dart';
import 'package:rent_hub/features/chat/controller/get_users_controller.dart';
import 'package:rent_hub/features/chat/view/pages/chat_details_page.dart';
import 'package:rent_hub/features/chat/widgets/chat_list_loading_widget.dart';
import 'package:rent_hub/features/chat/widgets/no_users_found_widget.dart';

class ChatListPage extends HookConsumerWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSearchVisible = useState(false);
    final searchFieldHeight = useState(0.0);
    final searchFieldOpacity = useState(0.0);
    final searchTermState = useState<String>('');

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

    /// Relaod the chat detials when opening this page
    useEffect(() {
      ref.read(getUserControllerProvider.notifier).updateChatUsersList(true);

      return null;
    }, []);

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
                        onChanged: (value) => searchTermState.value = value,
                      )
                    : SizedBox(),
              ),
            ),
          ),
          FutureBuilder(
            future: ref
                .read(getUserControllerProvider.notifier)
                .searchUsers(searchTermState.value),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Column(
                    children: [
                      Text(
                        "Error" + snapshot.error.toString(),
                      ),
                      IconButton(
                        onPressed: () {
                          ref.invalidate(getUserControllerProvider);
                        },
                        icon: Icon(Icons.refresh),
                      )
                    ],
                  ),
                );
              }

              if (snapshot.hasData) {
                if (snapshot.data != null && snapshot.data!.isEmpty) {
                  return Expanded(
                      child: Center(
                          child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NoUsersFoundWidget(),
                      SizedBox(
                        height: context.spaces.space_100,
                      ),
                      Text(
                        'No users found',
                        style: context.typography.bodySemibold,
                      ),
                    ],
                  )));
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    final doc = snapshot.data![index];

                    return Card(
                      child: ListTile(
                        onTap: () {
                          final image = doc.profileImage;
                          final name = doc.userName;
                          final receiverId = doc.userId;

                          context.push(
                            ChatDetailsPage.routePath,
                            extra: {
                              'image': image,
                              'name': name,
                              'receiverId': receiverId,
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
                                errorBuilder: (context, error, stackTrace) =>
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
                    );
                  },
                );
              }

              return Expanded(child: ChatListLoadingWidget());
            },
          ),
        ],
      ),
    );
  }
}
