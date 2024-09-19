import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/main.dart';

/// This utility is used to show toast messages in the app
final class ToastUtils {
  /// Show a toast message with the given message
  ///
  /// [message] is the message to be displayed in the toast
  /// [icon] is the icon to be displayed in the toast (Optional)
  static void showMessage({
    required String message,
    Icon? icon,
  }) {
    DelightToastBar(
      position: DelightSnackbarPosition.top,
      autoDismiss: true,
      builder: (context) => ToastCard(
        leading: icon,
        title: Text(
          message,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: context.spaces.space_200,
            color: AppColorPalettes.white500,
          ),
        ),
        color: context.colors.secondary,
      ),
    ).show(App.navigatorKey.currentContext!);
  }
}
