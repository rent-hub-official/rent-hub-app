import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/payment/payment_failed.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/theme/color_palette.dart';

class PaymentFailedIcon extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(paymentFailedProvider);
    return Container(
      width: context.spaces.space_300 * 8,
      height: context.spaces.space_300 * 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColorPalettes.red500,
          width: context.spaces.space_100,
        ),
      ),
      child: Center(
          child: Text(
        constants.txtExclamation,
        style: context.typography.h1Bold.copyWith(
            fontSize: context.spaces.space_700 * 2,
            color: AppColorPalettes.red500),
      )),
    );
  }
}
