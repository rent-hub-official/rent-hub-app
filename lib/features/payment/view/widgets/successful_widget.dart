import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';

class SuccessfulWidget extends StatelessWidget {
  const SuccessfulWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          width: context.spaces.space_300 * 7,
          height: context.spaces.space_300 * 7,
          child: Center(
            child: Icon(
              Icons.check,
              color: AppColorPalettes.white500,
              size: 130,
            ),
          ),
          decoration: BoxDecoration(
              color: AppColorPalettes.green, shape: BoxShape.circle),
        ),
      ),
      width: context.spaces.space_300 * 10,
      height: context.spaces.space_300 * 10,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: AppColorPalettes.white100),
    );
  }
}
