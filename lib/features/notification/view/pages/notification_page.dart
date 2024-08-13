import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/constants/notification/notification_page_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/notification_page/notification_tile_widget.dart';
import 'package:rent_hub/features/notification/controller/notifications_list_controller.dart';

class NotificationPage extends ConsumerWidget {
  static const routePath = '/notification';
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(notificationPageConstantsProvider);
    final notificationList = ref.watch(notificationsListProvider);

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
                ref.read(notificationsListProvider.notifier).removeAll();
              },
              icon: Icons.delete_forever,
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
            SizedBox(height: context.spaces.space_100),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  ref.refresh(notificationsListProvider);
                },
                child: ListView.builder(
                  itemCount: notificationList.length,
                  itemBuilder: (context, index) {
                    final notification = notificationList[index];
                    return Dismissible(
                      key: Key(notification.id.toString()),
                      onDismissed: (direction) {
                        ref
                            .read(notificationsListProvider.notifier)
                            .remove(id: notification.id);
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.delete, color: Colors.white),
                      ),
                      child: NotificationTileWidget(
                        title: notification.title,
                        subTitle: notification.subTitle,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
