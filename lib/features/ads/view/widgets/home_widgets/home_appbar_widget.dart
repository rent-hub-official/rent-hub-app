import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/ads/view/pages/location_search_page.dart';
import 'package:rent_hub/features/ads/view/pages/notification_page.dart';
import 'package:rent_hub/features/ads/view/pages/search/search_page.dart';

class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      backgroundColor: context.colors.appBarBackground,
      pinned: false,
      title: Row(
        children: [
          InkWell(
            onTap: () {
              context.push(LocationSearchPage.routePath);
            },
            borderRadius: BorderRadius.circular(16),
            child: Row(
              children: [
                const Icon(Icons.place_outlined),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.spaces.space_100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "currentLocTitle",
                        style: context.typography.bodySemibold,
                      ),
                      Text(
                        "stateCountrySubtitle",
                        style: context.typography.bodySmall,
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(right: context.spaces.space_100),
            child: RoundedIconButton(
              onTap: () {
                context.push(SearchPage.routePath);
              },
              icon: Icons.search,
            ),
          ),
          RoundedIconButton(
            onTap: () {
              context.push(NotificationPage.routePath);
            },
            icon: Icons.notifications,
          ),
        ],
      ),
    );
  }
}
