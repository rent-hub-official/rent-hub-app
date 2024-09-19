import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/main.dart';

/// This is used to perform any kind of Bottom sheet related actions like
/// showing a bottom sheet, etc.
final class BottomSheetUtils {
  /// Display a new bottom sheet with the given child widget
  ///
  /// [child] is the widget that will be displayed in the bottom sheet
  static void show(Widget child) {
    final BuildContext context = App.navigatorKey.currentContext!;

    showModalBottomSheet(
      context: context,
      backgroundColor: context.colors.cardBackground,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(context.spaces.space_300),
          topLeft: Radius.circular(context.spaces.space_300),
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
}
