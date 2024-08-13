import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

void bottomSheetWidget({required BuildContext context, required Widget child}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      side: BorderSide(width: 1.5, color: context.colors.border),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(context.spaces.space_500),
        topLeft: Radius.circular(context.spaces.space_500),
      ),
    ),
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: child,
          ),
        ),
      );
    },
  );
}
