import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/main.dart';

/// The utiltiy class used to interact with the alert dialog
class AlertDialogUtils {
  /// Show an alert dialog with given title, subtitle and action buttons
  static void show({
    required String title,
    required String description,
    required String phoneNumber,

    /// Each action should have a string as key. (This string will be displayed
    /// as a button in the alert dialog) and a void callback as value. (This is the
    /// callback that will be attached to the onPressed event of the button)
    required Map<String, VoidCallback> actions,
  }) {
    final BuildContext context = App.navigatorKey.currentContext!;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(context.spaces.space_200),
            child: Container(
              constraints: const BoxConstraints(minWidth: 300, maxWidth: 500),
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.colors.dialogBackground,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: EdgeInsets.all(context.spaces.space_200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: context.typography.h2SemiBold.copyWith(
                        decoration: TextDecoration.none,
                        color: AppColorPalettes.white500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: context.spaces.space_100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            description,
                            style: context.typography.bodyLarge.copyWith(
                              decoration: TextDecoration.none,
                              color: AppColorPalettes.white500,
                            ),
                          ),
                          Text(
                            phoneNumber,
                            style: context.typography.bodyLarge.copyWith(
                              decoration: TextDecoration.none,
                              color: AppColorPalettes.white500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: context.spaces.space_400),
                      child: Row(
                        children: [
                          const Spacer(
                              // flex: 1,
                              ),
                          SizedBox(
                            width: 98,
                            height: 37,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                    context.colors.secondary),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        context.spaces.space_250),
                                  ),
                                ),
                              ),
                              onPressed: actions.values.first,
                              child: Text(
                                actions.keys.first,
                                style: context.typography.buttonText,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: context.spaces.space_100),
                            child: SizedBox(
                              width: context.spaces.space_300 * 4,
                              height: 37,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all<Color>(
                                          context.colors.primary),
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          context.spaces.space_250),
                                    ),
                                  ),
                                ),
                                onPressed: actions.values.last,
                                child: Text(
                                  actions.keys.last,
                                  style: context.typography.buttonText.copyWith(
                                      color: AppColorPalettes.black500),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
