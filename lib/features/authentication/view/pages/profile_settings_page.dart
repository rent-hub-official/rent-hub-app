import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/user_profile_constants/user_profile_settings.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/textfeild_widget.dart';
import 'package:rent_hub/features/authentication/view/widgets/profile_image_widget.dart';
import 'package:rent_hub/features/authentication/view/widgets/profile_settings_field_widget.dart';

class ProfileSettingsPage extends HookConsumerWidget {
  const ProfileSettingsPage({super.key});
  static const routePath = '/profileSettings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // name editing controller
    final nameEditingController = useTextEditingController(text: "Divyesh");

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
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
              onEdit: () {},
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
              onPressed: () {},
            ),
            // change phone number
            ProfileSettingsFieldWidget(
              title:
                  ref.watch(userProfileSettingsConstantsProvider).txtChangeNo,
              onPressed: () {},
            ),
            // log out
            ProfileSettingsFieldWidget(
              title: ref.watch(userProfileSettingsConstantsProvider).txtLOgOut,
              onPressed: () {},
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
