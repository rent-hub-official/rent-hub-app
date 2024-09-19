import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/constants/ads/home_screen.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/ads/controller/location_controller/user_saved_location_provider.dart';
import 'package:rent_hub/features/ads/view/pages/location_search_page.dart';
import 'package:rent_hub/features/notification/view/pages/notification_page.dart';
import 'package:rent_hub/features/ads/view/pages/search/search_page.dart';

class HomeAppBarWidget extends ConsumerWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? selectedLocationTitle =
        ref.watch(userSavedLocationProvider)?.mainText;
    final String? selectedLocationAddress =
        ref.watch(userSavedLocationProvider)?.secondaryText;

    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      backgroundColor: context.colors.appBarBackground,
      pinned: false,
      snap: true,
      title: InkWell(
        onTap: () {
          context.push(LocationSearchPage.routePath);
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: context.spaces.space_50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.place_outlined),
              SizedBox(width: context.spaces.space_100),
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      selectedLocationTitle ??
                          ref
                              .watch(homeScreenConstantsProvider)
                              .txtSelectLocation,
                      style: context.typography.bodySemibold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (selectedLocationAddress != null)
                      Text(
                        selectedLocationAddress,
                        style: context.typography.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        RoundedIconButton(
          onTap: () {
            context.push(SearchPage.routePath);
          },
          icon: Icons.search,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.spaces.space_100),
          child: RoundedIconButton(
            onTap: () {
              context.push(NotificationPage.routePath);
            },
            icon: Icons.notifications,
          ),
        ),
      ],
    );
  }
}
