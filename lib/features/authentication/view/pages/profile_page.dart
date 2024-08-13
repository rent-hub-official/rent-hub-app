import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/icon_constants.dart';
import 'package:rent_hub/core/constants/authentication/profile_page_constants.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/features/orders/view/pages/history_details_page.dart';
import 'package:rent_hub/features/ads/view/pages/my_products_page.dart';
import 'package:rent_hub/features/authentication/controller/account_details_provider/account_details_provider.dart';
import 'package:rent_hub/features/authentication/view/pages/profile_settings_page.dart';
import 'package:rent_hub/features/authentication/view/widgets/profile_header_widget.dart';
import 'package:rent_hub/features/authentication/view/widgets/profile_option_tile_widget.dart';
import 'package:rent_hub/features/authentication/view/widgets/theme_switch_button.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  static const routePath = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use PostFrameCallback to ensure the invalidation happens after the build is complete
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.invalidate(getUserDetailsProvider);
      });

      return null;
    }, []);

    final constants = ref.watch(profilePageConstantsProvider);

    /// Get the current theme and if it is dark set the switch to false.
    /// Else this will be true.
    final themeSwitch =
        useState<bool>(Theme.of(context).brightness == Brightness.light);

    return Scaffold(
      body: ref.watch(getUserDetailsProvider).when(
            data: (data) => SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      right: context.spaces.space_200,
                      top: context.spaces.space_500,
                    ),
                    color: context.colors.primary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ThemeSwitchButton(themeSwitch: themeSwitch),
                      ],
                    ),
                  ),
                  ProfileHeaderWidget(
                    name: data.data()?.userName ?? "Unknown",
                    phone: data.id,
                    child: ClipOval(
                      child: Image.network(
                        fit: BoxFit.cover,
                        data.data()?.profileImage ??
                            'https://cdn-icons-png.flaticon.com/512/149/149071.png',
                        height: double.infinity,
                        width: double.infinity,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                                ref.watch(iconConstantsProvider).icProfile),
                      ),
                    ), //profile image
                  ),
                  Padding(
                    padding: EdgeInsets.all(context.spaces.space_200),
                    child: Column(
                      children: [
                        ProfileOptionTile(
                          icon: Icons.assignment,
                          text: constants.txtMyAds,
                          onTap: () {
                            context.push(MyProductsPage.routePath);
                          },
                        ),
                        ProfileOptionTile(
                          icon: Icons.history,
                          text: constants.txtOrderHistory,
                          onTap: () {
                            context.push(HistoryDetailsPage.routePath);
                          },
                        ),
                        ProfileOptionTile(
                          icon: Icons.settings,
                          text: constants.txtAccountSettings,
                          onTap: () {
                            context.push(ProfileSettingsPage.routePath);
                          },
                        ),
                        ProfileOptionTile(
                          icon: Icons.help,
                          text: constants.txtHelpSupport,
                          subtitle: constants.txtsubHelp,
                          onTap: () {
                            context.push(ProfileSettingsPage.routePath);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            error: (error, stackTrace) {
              return Center(
                child: Text(error.toString()),
              );
            },
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
