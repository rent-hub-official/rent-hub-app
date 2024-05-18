import 'package:flutter/material.dart';

class ErrorSnackBar extends SnackBar {
  final String errorMessage;
  final BuildContext context;
ErrorSnackBar(this.context, {super.key, required this.errorMessage})
      : super(
          content: Text(
            errorMessage,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          backgroundColor: Colors.redAccent[700],
        );
}