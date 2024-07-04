import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/icon_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/authentication/controller/account_details_provider/account_details_provider.dart';
import 'package:rent_hub/features/authentication/controller/authenticcation_provider/authentication_provider.dart';

class ProfileImgeWidget extends ConsumerWidget {
  const ProfileImgeWidget({
    super.key,
    required this.onEdit,
  });
  final void Function() onEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(authenticationProvider).phoneNumber ?? "";
    final profileImage = ref
            .watch(GetAccountDetailsProvider(
              userId: userId,
            ))
            .value
            ?.data()
            ?.profileImage ??
        ref.watch(iconConstantsProvider).icProfile;
    return Center(
      child: CircleAvatar(
        radius: context.spaces.space_900 * 1.1,
        backgroundColor: context.colors.secondary,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: context.spaces.space_900,
                backgroundImage: NetworkImage(profileImage),
              ),
            ),
            Positioned(
              right: 0,
              top: context.spaces.space_200,
              child: RoundedIconButton(
                onTap: onEdit,
                icon: Icons.edit,
                backgroundColor: context.colors.primary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
