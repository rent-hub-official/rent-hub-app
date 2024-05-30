import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

DelightToastBar showAlertBox({required String text, Widget? icon}) {
  return DelightToastBar(
    autoDismiss: true,
    builder: (context) => ToastCard(
      leading: icon,
      title: Text(text, style: context.typography.bodySemibold),
    ),
  );
}
