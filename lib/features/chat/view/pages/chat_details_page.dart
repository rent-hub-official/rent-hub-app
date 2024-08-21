import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/features/chat/controller/format_time_controller.dart';
import 'package:rent_hub/features/chat/controller/last_seen_controller.dart';
import 'package:rent_hub/features/chat/widgets/chat_body_widget.dart';
import 'package:rent_hub/features/chat/widgets/input_message_field_widget.dart';

class ChatDetailsPage extends HookConsumerWidget {
  static const routePath = '/chatDetails';

  ChatDetailsPage({
    super.key,
    required this.receiverId,
    required this.userImage,
    required this.userName,
  });

  final String receiverId;
  final String userImage;
  final String userName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputMessageController = useTextEditingController();
    final userStatus = ref.watch(lastSeenProvider(receiverId));

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
            SizedBox(width: context.spaces.space_150),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: context.typography.h3Bold,
                ),
                HookBuilder(
                  builder: (context) {
                    /// Just to update the online status every 30 seconds
                    final lastUpdatedAt = useState(DateTime.now());
                    useEffect(() {
                      final timer =
                          Timer.periodic(Duration(seconds: 30), (timer) {
                        lastUpdatedAt.value = DateTime.now();
                      });

                      return () {
                        timer.cancel();
                      };
                    }, []);

                    return userStatus.when(
                      data: (data) {
                        final currentTime = Timestamp.now();

                        final diff = currentTime
                            .toDate()
                            .difference(data.lastSeen.toDate())
                            .inSeconds;

                        return Text(
                          diff <= 60
                              ? "Online"
                              : 'Last seen at ${ref.read(
                                  FormatTimeProvider(timestamp: data.lastSeen),
                                )}',
                          style: context.typography.body,
                        );
                      },
                      error: (error, stackTrace) => Text('error'),
                      loading: () => Text(
                        'Connecting...',
                        style: context.typography.body,
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
      body: ChatBody(
        receiverId: receiverId,
        recieverImage: userImage,
        recieverName: userName,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: context.colors.bottomNavBar,
        shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.spaces.space_400),
          ),
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.spaces.space_400),
          ),
          1,
        ),
        foregroundColor: Colors.transparent,
        extendedPadding: EdgeInsets.zero,
        focusElevation: 0,
        onPressed: () {},
        label: SizedBox(
          width:
              MediaQuery.of(context).size.width * 0.9, // Adjust width as needed
          child: InputMessageFieldWidget(
            controller: inputMessageController,
            senderId: FirebaseAuth.instance.currentUser!.phoneNumber!,
            receiverId: receiverId,
            recieverImage: userImage,
            recieverName: userName,
          ),
        ),
      ),
    );
  }
}


//  userStatus.when(
//                     data: (data) => Text(
//                           data.data()?.lastSeen != null
//                               ? "Last seen "
//                               : "online",
//                           style: context.typography.body,
//                         ),
//                     error: (error, stackTrace) => Text("offline"),
//                     loading: () => Text("Connecting...")),