import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

void bottomSheetWidget({required BuildContext context, required Widget child}) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      side: const BorderSide(width: 1.5),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(context.spaces.space_500),
        topLeft: Radius.circular(context.spaces.space_500),
      ),
    ),
    builder: (context) {
      return child;
    },
  );
}
