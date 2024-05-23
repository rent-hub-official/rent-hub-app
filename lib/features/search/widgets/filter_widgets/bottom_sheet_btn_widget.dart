import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

InkWell filterBottomSheetBtn(
    {required BuildContext context,
    required Color color,
    required String text,
    required void Function() onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: context.spaces.space_900 * 2.3,
      height: context.spaces.space_600,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(context.spaces.space_900)),
      child: Center(
        child: Text(
          text,
          style: context.typography.buttonText,
        ),
      ),
    ),
  );
}
