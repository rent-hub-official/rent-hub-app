import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

Padding checkBoxFilterWidget(
    {required BuildContext context,
    required String text,
    required void Function(bool? status) onChanged,
    bool value = false}) {
  return Padding(
    padding: EdgeInsets.only(top: context.spaces.space_150),
    child: Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
              activeColor: context.colors.primary,
              value: value,
              onChanged: onChanged),
        ),
        Padding(
          padding: EdgeInsets.only(left: context.spaces.space_150),
          child: Text(
            text,
            style: context.typography.body,
          ),
        )
      ],
    ),
  );
}
