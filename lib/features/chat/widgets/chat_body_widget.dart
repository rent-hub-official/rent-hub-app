import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/features/chat/controller/format_time_controller.dart';
import 'package:rent_hub/features/chat/controller/get_messages_controller.dart';
import 'package:rent_hub/features/chat/widgets/chat_date_indicator_widget.dart';
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

    final floatingDateIndicatorKey = useMemoized(() => GlobalKey());
    final floatingDateIndicatorVisible = useState(true);
    final dateIndicatorValue = useState<DateTime>(DateTime.now());

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
                        /// Sorted keys of the messages based on the date
                        final sortedKeys = data.keys.toList()
                          ..sort((a, b) => a.compareTo(b));

                        /// Keys for the date labels
                        final dateIndicatorKeys = useMemoized(
                            () => List.generate(
                                sortedKeys.length, (i) => GlobalKey()),
                            [sortedKeys.length]);

                        /// Update the date indicator value based on the scroll position
                        void checkDateIndicatorVisibility() {
                          final dateIndicatorRenderBoxe =
                              floatingDateIndicatorKey.currentContext
                                  ?.findRenderObject() as RenderBox?;
                          final dateIndicatorPosition = dateIndicatorRenderBoxe
                              ?.localToGlobal(Offset.zero)
                              .dy;

                          DateTime? dateForIndicator;
                          for (int i = 0; i < dateIndicatorKeys.length; i++) {
                            final renderBox = dateIndicatorKeys[i]
                                .currentContext
                                ?.findRenderObject() as RenderBox?;
                            final currentIndicatorPosition =
                                renderBox?.localToGlobal(Offset.zero).dy;

                            if (currentIndicatorPosition != null) {
                              if (currentIndicatorPosition ==
                                  dateIndicatorPosition) {
                                dateForIndicator = sortedKeys[i];
                              } else if (dateIndicatorPosition != null &&
                                  currentIndicatorPosition >
                                      dateIndicatorPosition) {
                                dateForIndicator = sortedKeys[i - 1];
                              }

                              if (dateForIndicator != null) {
                                dateIndicatorValue.value = dateForIndicator;

                                break;
                              }
                            }
                          }

                          if (dateForIndicator == null) {
                            dateForIndicator = sortedKeys.last;
                            dateIndicatorValue.value = dateForIndicator;
                          }

                          /// Hide the indicator if the date is today
                          final now = DateTime.now();
                          final today = DateTime(now.year, now.month, now.day);
                          if (dateForIndicator == today) {
                            floatingDateIndicatorVisible.value = false;
                          } else {
                            floatingDateIndicatorVisible.value = true;
                          }
                        }

                        void scrollListener() {
                          checkDateIndicatorVisibility();

                          if (scrollController.position.extentAfter != 0) {
                            isUserScrolled.value = true;
                          }
                        }

                        /// To make the listview scroll to the bottom automatically when the user is not scrolling manually
                        useEffect(() {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            scrollController.position
                                .addListener(scrollListener);
                          });

                          return () {
                            scrollController.removeListener(scrollListener);
                          };
                        }, []);

                        return Stack(
                          children: [
                            ListView(
                              controller: scrollController,
                              children: [
                                for (int i = 0; i < sortedKeys.length; i++) ...[
                                  Center(
                                    child: ChatDateIndicatorWidget(
                                      date: sortedKeys[i],
                                      key: dateIndicatorKeys[i],
                                    ),
                                  ),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: data[sortedKeys[i]]!.length,
                                    itemBuilder: (context, index) {
                                      /// Automatically scroll to the bottom when the user is not scrolling manually
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        checkDateIndicatorVisibility();

                                        if (!isUserScrolled.value) {
                                          scrollController.jumpTo(
                                              scrollController
                                                  .position.maxScrollExtent);
                                        }
                                      });

                                      final message =
                                          data[sortedKeys[i]]![index];
                                      if (currentUserId == message.senderId &&
                                          receiverId == message.receiverId) {
                                        return SentMessageWidget(
                                          message: message.message ?? '',
                                          time: ref.watch(FormatTimeProvider(
                                              timestamp: message.time)),
                                        );
                                      } else if (currentUserId ==
                                              message.receiverId &&
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
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      height: context.spaces.space_100,
                                    ),
                                  ),
                                ],
                                SizedBox(height: context.spaces.space_100 * 10),
                              ],
                            ),
                            Opacity(
                              opacity:
                                  floatingDateIndicatorVisible.value ? 1 : 0,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: ChatDateIndicatorWidget(
                                  key: floatingDateIndicatorKey,
                                  date: dateIndicatorValue.value,
                                ),
                              ),
                            ),
                          ],
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
