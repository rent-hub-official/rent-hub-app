import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/features/chat/controller/format_time_controller.dart';
import 'package:rent_hub/features/chat/controller/get_messages_controller.dart';
import 'package:rent_hub/features/chat/widgets/received_message_widget.dart';
import 'package:rent_hub/features/chat/widgets/sent_message_widget.dart';

class ChatBody extends HookConsumerWidget {
  const ChatBody({
    super.key,
    required this.receiverId,
    required this.recieverImage,
    required this.recieverName,
  });

  final String receiverId;
  final String recieverName;
  final String recieverImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final isUserScrolled = useState(false);

    final currentUserId = FirebaseAuth.instance.currentUser!.phoneNumber!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.spaces.space_200),
      child: Column(
        children: [
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return ref.watch(GetMessagesProvider(userId: receiverId)).when(
                    data: (data) {
                      return HookBuilder(builder: (context) {
                        useEffect(() {
                          void scrollListener() {
                            if (scrollController.position.extentAfter != 0) {
                              isUserScrolled.value = true;
                            }
                          }

                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            scrollController.position
                                .addListener(scrollListener);
                          });

                          return () {
                            scrollController.removeListener(scrollListener);
                          };
                        }, []);

                        return ListView.separated(
                          itemCount: data.length + 1,
                          controller: scrollController,
                          itemBuilder: (context, index) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (!isUserScrolled.value) {
                                scrollController.jumpTo(
                                    scrollController.position.maxScrollExtent);
                              }
                            });

                            if (index == data.length) {
                              return SizedBox(
                                  height: context.spaces.space_100 * 10);
                            }

                            final message = data[index];
                            if (currentUserId == message.senderId &&
                                receiverId == message.receiverId) {
                              return SentMessageWidget(
                                message: message.message ?? '',
                                time: ref.watch(FormatTimeProvider(
                                    timestamp: message.time)),
                              );
                            } else if (currentUserId == message.receiverId &&
                                receiverId == message.senderId) {
                              return ReceviedMessageWidget(
                                image: recieverImage,
                                message: message.message ?? '',
                                time: ref.watch(FormatTimeProvider(
                                    timestamp: message.time)),
                              );
                            }
                            return SizedBox.shrink();
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            height: context.spaces.space_100,
                          ),
                        );
                      });
                    },
                    error: (error, stackTrace) => Center(
                      child: Text(error.toString()),
                    ),
                    loading: () => Center(child: CircularProgressIndicator()),
                  );
            }),
          ),
        ],
      ),
    );
  }
}
