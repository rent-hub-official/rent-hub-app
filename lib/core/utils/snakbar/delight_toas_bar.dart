import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';

final class TosterUtil {
  static void showMessage({
    required BuildContext context,
    String? message,
    required Icon icon,
  }) {
    if (message == null) {
      return;
    }

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
            color: AppColorPalettes
                .white500, // Set text color to white for better contrast
          ),
        ),
        color: context.colors.secondary, // Set a nice background color
        // Add padding for better spacing
      ),
    ).show(context);
  }
}
