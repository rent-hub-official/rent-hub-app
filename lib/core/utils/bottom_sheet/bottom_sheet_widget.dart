import 'package:flutter/material.dart';

void bottomSheetWidget({required BuildContext context, required Widget child}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return child;
    },
  );
}
