import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/constants/notification_page_constants/notification_page_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/notification_page/notification_tile_widget.dart';

class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(notificationPageConstantsProvider);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(context.spaces.space_50),
          child: RoundedbtnWidget(
            onTap: () {
              context.pop();
            },
            icon: Icons.chevron_left,
            backgroundclr: AppColorPalettes.grey200,
          ),
        ),
        title: Text(
          constants.txtHeading,
          style: context.typography.h2SemiBold,
        ),
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
              itemCount: 2,
              itemBuilder: (context, index) => const NotificationTileWidget(
                title: 'Lorem Ipsum',
                subTitle:
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
