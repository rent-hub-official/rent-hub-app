import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/ads/user_profile_settings.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/textfeild_widget.dart';
import 'package:rent_hub/features/authentication/controller/authenticcation_provider/authentication_provider.dart';
import 'package:rent_hub/features/authentication/view/widgets/profile_image_widget.dart';
import 'package:rent_hub/features/authentication/view/widgets/profile_settings_field_widget.dart';
import 'package:rent_hub/features/payment/pages/add_bank_ac_details_page.dart';

class ProfileSettingsPage extends HookConsumerWidget {
  static const routePath = '/profileSettings';
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // name editing controller
    final nameEditingController = useTextEditingController(text: "Divyesh");

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // TODO: CHECK IT
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          ref.watch(userProfileSettingsConstantsProvider).appTitle,
        ),
        titleTextStyle: context.typography.h1SemiBold,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.spaces.space_200,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // profile picture
            ProfileImgeWidget(
              onEdit: () {
                // TODO : AMAL
              },
            ),
            // height spacing
            SizedBox(height: context.spaces.space_600),
            // user name
            Text(
              ref.watch(userProfileSettingsConstantsProvider).txtName,
              style: context.typography.bodyLarge,
            ),
            TextFeildWidget(
              textController: nameEditingController,
              validator: (value) {
                // TODO
                return;
              },
              suffixicon: Icon(
                Icons.edit,
                color: context.colors.secondary,
              ),
            ),
            // bank account
            ProfileSettingsFieldWidget(
              title: ref
                  .watch(userProfileSettingsConstantsProvider)
                  .txtBankAccount,
              onPressed: () {
                context.push(AddBankAcDetailsPage.routePath);
              },
            ),
            // change phone number
            ProfileSettingsFieldWidget(
              title:
                  ref.watch(userProfileSettingsConstantsProvider).txtChangeNo,
              onPressed: () {
                // TODO AMAL
              },
            ),
            // log out
            ProfileSettingsFieldWidget(
              title: ref.watch(userProfileSettingsConstantsProvider).txtLOgOut,
              onPressed: () {
                // TODO CHECK IT
                ref.watch(authenticationProvider.notifier).logoutUser(context);
              },
            ),
            // delete account
            ProfileSettingsFieldWidget(
              title: ref
                  .watch(userProfileSettingsConstantsProvider)
                  .txtDeleteAccount,
              onPressed: () {},
            ),
            // version
          ],
        ),
      ),
    );
  }
}
