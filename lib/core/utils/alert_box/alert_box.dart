import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

void showAlertDialog({
  required BuildContext context,
  required String titile,
  required String subtitile,
  required String editButtonText,
  required String continueButtonText,
  required void Function() editButtononPressed,
  required void Function() continueButtononPressed,
  required String phoneNumber,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(context.spaces.space_200),
          child: Container(
            constraints: const BoxConstraints(minWidth: 300, maxWidth: 500),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 20, 20, 20),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: EdgeInsets.all(context.spaces.space_200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    titile,
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
                          subtitile,
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
                            onPressed: editButtononPressed,
                            child: Text(
                              editButtonText,
                              style: context.typography.buttonText,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: context.spaces.space_100),
                          child: SizedBox(
                            width: 122,
                            height: 37,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                    context.colors.primary),
                                shape: WidgetStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        context.spaces.space_250),
                                  ),
                                ),
                              ),
                              onPressed: continueButtononPressed,
                              child: Text(
                                continueButtonText,
                                style: context.typography.buttonText
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
