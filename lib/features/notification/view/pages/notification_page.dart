import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/constants/notification/notification_page_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/notification_page/notification_tile_widget.dart';

class NotificationPage extends ConsumerWidget {
  static const routePath = '/notification';
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(notificationPageConstantsProvider);

    final _notificationList = ref.watch(notificationList);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(context.spaces.space_50),
          child: RoundedIconButton(
            onTap: () {
              context.pop();
            },
            icon: Icons.chevron_left,
          ),
        ),
        title: Text(
          constants.txtHeading,
          style: context.typography.h2SemiBold,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(context.spaces.space_50),
            child: RoundedIconButton(
              onTap: () {
                ref.read(notificationList.notifier).state = [
                  {
                    'title': 'Notification 1',
                    'subTitle': 'This is the first notification'
                  },
                  {
                    'title': 'Notification 2',
                    'subTitle': 'This is the second notification'
                  },
                  {
                    'title': 'Notification 3',
                    'subTitle': 'This is the third notification'
                  },
                  {
                    'title': 'Notification 4',
                    'subTitle': 'This is the fourth notification'
                  },
                  {
                    'title': 'Notification 5',
                    'subTitle': 'This is the fifth notification'
                  },
                ];
              },
              icon: Icons.alarm,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(context.spaces.space_200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              constants.txtSubHeading,
              style: context.typography.bodySemibold,
            ),
            SizedBox(
              height: context.spaces.space_100,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _notificationList.length,
              itemBuilder: (context, index) => NotificationTileWidget(
                title: _notificationList[index]['title'],
                subTitle: _notificationList[index]['subTitle'],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final StateProvider notificationList =
    StateProvider<List<Map<String, String>>>((ref) => []);
