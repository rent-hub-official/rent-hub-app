import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';

class SliverAppbarWidget extends StatelessWidget {
  final String currentLocTitle;
  final String stateCountrySubtitle;
  final Function() searchbtnOnTap;
  final Function() notificationbtnOnTap;
  const SliverAppbarWidget({
    super.key,
    required this.currentLocTitle,
    required this.stateCountrySubtitle,
    required this.searchbtnOnTap,
    required this.notificationbtnOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      backgroundColor: context.colors.appBarBackground,
      pinned: false,
      title: Row(
        children: [
          const Icon(Icons.place_outlined),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.spaces.space_100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentLocTitle,
                  style: context.typography.bodySemibold,
                ),
                Text(
                  stateCountrySubtitle,
                  style: context.typography.bodySmall,
                ),
              ],
            ),
          ),
          const Icon(Icons.keyboard_arrow_down),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(right: context.spaces.space_100),
            child: RoundedIconButton(
              onTap: searchbtnOnTap,
              icon: Icons.search,
            ),
          ),
          RoundedIconButton(
            onTap: notificationbtnOnTap,
            icon: Icons.notifications,
          ),
        ],
      ),
    );
  }
}
