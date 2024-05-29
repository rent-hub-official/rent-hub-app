import 'package:flutter/material.dart';
import 'package:rent_hub/core/utils/snakbar/error_snackbar.dart';

extension SnackBarExtension on BuildContext {
  showErrorSnackBar(String errorMessage) {
    ScaffoldMessenger.of(this).showSnackBar(
      ErrorSnackBar(
        this,
        errorMessage: errorMessage,
      ),
    );
  }
}
