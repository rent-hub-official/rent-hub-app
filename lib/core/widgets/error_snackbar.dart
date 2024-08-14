import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/main.dart';

class ErrorSnackBar extends SnackBar {
  final String errorMessage;

  ErrorSnackBar({super.key, required this.errorMessage})
      : super(
          content: Text(
            errorMessage,
            style: Theme.of(App.navigatorKey.currentContext!)
                .textTheme
                .titleMedium!
                .copyWith(
                  color: Colors.white,
                ),
          ),
          behavior: SnackBarBehavior.floating,
          margin:
              EdgeInsets.all(App.navigatorKey.currentContext!.spaces.space_200),
          backgroundColor: Colors.redAccent[700],
        );
}
