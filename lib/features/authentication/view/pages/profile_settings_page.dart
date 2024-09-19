import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/ads/user_profile_settings.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/core/widgets/textfield_widget.dart';
import 'package:rent_hub/features/authentication/controller/account_details_provider/account_details_provider.dart';
import 'package:rent_hub/features/authentication/controller/authenticcation_provider/authentication_provider.dart';
import 'package:rent_hub/features/authentication/controller/image_picker_provider.dart';
import 'package:rent_hub/features/authentication/view/widgets/profile_image_selector_widget.dart';
import 'package:rent_hub/features/authentication/view/widgets/profile_settings_field_widget.dart';
import 'package:rent_hub/features/payment/view/pages/add_bank_ac_details_page.dart';

class ProfileSettingsPage extends HookConsumerWidget {
  static const routePath = '/profileSettings';
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
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
      body: ref.watch(getUserDetailsProvider).when(
            data: (data) {
              // name editing controller
              final nameEditingController =
                  useTextEditingController(text: data.data()?.userName ?? "");

              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.spaces.space_200,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // profile picture
                      Center(
                        child: ProfileImageSelectorWidget(
                          imageDbRef: data.data()?.profileImage ?? '',
                        ),
                      ),

                      // height spacing
                      SizedBox(height: context.spaces.space_600),
                      // user name
                      Text(
                        ref.watch(userProfileSettingsConstantsProvider).txtName,
                        style: context.typography.bodyLarge,
                      ),
                      TextFieldWidget.TextFielddWidget(
                        suffix: IconButton(
                            onPressed: () {
                              ref.invalidate(accountDetailsProvider);
                            },
                            icon: Icon(Icons.edit)),
                        onFieldSubmitted: (value) {
                          ref.watch(accountDetailsProvider.notifier).addData(
                                accountDetails: data.data(),
                                image: ref.read(imagePickerProvider),
                                userName: value,
                              );
                        },
                        textController: nameEditingController,
                        validator: (value) {
                          return;
                        },
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

                      // log out
                      ProfileSettingsFieldWidget(
                        title: ref
                            .watch(userProfileSettingsConstantsProvider)
                            .txtLOgOut,
                        onPressed: () {
                          // logout btn tap
                          ref.watch(authenticationProvider.notifier).logout();
                        },
                      ),
                      ProfileSettingsFieldWidget(
                        title: ref
                            .watch(userProfileSettingsConstantsProvider)
                            .txtDeleteAccount,
                        onPressed: () {
                          ref
                              .watch(accountDetailsProvider.notifier)
                              .deleteAccount();
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: context.spaces.space_600),
                        child: PrimaryBtnWidget(
                          onTap: () {
                            ref.read(accountDetailsProvider.notifier).addData(
                                  accountDetails: data.data(),
                                  userName: nameEditingController.text,
                                  image: ref.read(imagePickerProvider),
                                );
                            context.pop();
                          },
                          label: "Save",
                        ),
                      )
                      // version
                    ],
                  ),
                ),
              );
            },
            error: (error, stackTrace) {
              return Center(
                child: Column(
                  children: [
                    Text("Reload"),
                    IconButton(
                        onPressed: () {
                          ref.invalidate(getUserDetailsProvider);
                        },
                        icon: Icon(Icons.refresh))
                  ],
                ),
              );
            },
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
