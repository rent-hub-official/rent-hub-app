
import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';

void showAlertDialog({
  required BuildContext context,
  required String titile,
  required String subtitile,
  required String editButtonText,
  required String continueButtonText,
  required void Function() editButtononPressed,
  required void Function() continueButtononPressed,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final colors = AppTheme.of(context).colors;
      final typography = AppTheme.of(context).typography;
      final spacer = AppTheme.of(context).spaces;
      return Center(
        child: Padding(
          padding:  EdgeInsets.all(spacer.space_200),
          child: Container(
            constraints: const BoxConstraints(minWidth: 300, maxWidth: 500),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 20, 20, 20),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding:  EdgeInsets.all(spacer.space_200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(titile, style: typography.h2SemiBold),
                  Padding(
                    padding:  EdgeInsets.only(top: spacer.space_100),
                    child: Text(subtitile, style: typography.bodyLarge),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:spacer.space_400 ),
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
                                  colors.secondary),
                              shape: WidgetStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(spacer.space_250),
                                ),
                              ),
                            ),
                            onPressed: editButtononPressed,
                            child: Text(
                              editButtonText,
                              style: typography.buttonText,
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: spacer.space_100),
                          child: SizedBox(
                            width: 122,
                            height: 37,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                    colors.primary),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(spacer.space_250),
                                  ),
                                ),
                              ),
                              onPressed: continueButtononPressed,
                              child: Text(
                                continueButtonText,
                                style: typography.buttonText
                                    .copyWith(color: AppColorPalettes.black500),
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