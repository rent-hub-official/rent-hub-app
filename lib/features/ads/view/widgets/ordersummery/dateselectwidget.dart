import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/theme/extensions/app_color_extension.dart';
import 'package:rent_hub/core/theme/extensions/app_typography_extension.dart';
import 'package:rent_hub/core/theme/extensions/space_extension.dart';

class DateselectWidget extends ConsumerWidget {
  const DateselectWidget(this.onpressed,
      {super.key,
      required this.typography,
      required this.spacer,
      required this.colors,
      required this.selectedDate,
      required this.date});
  final void Function() onpressed;
  final String date;
  final AppTypographyExtension typography;
  final AppSpaceExtension spacer;
  final AppColorExtension colors;
  final DateTime selectedDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = selectedDate;

    return Padding(
      padding: EdgeInsets.only(top: context.spaces.space_125),
      child: Container(
        height: 53,
        decoration: BoxDecoration(
          border: Border.all(
            color: context.colors.border,
            width: .5,
          ),
          color: AppColorPalettes.white500,
          borderRadius: BorderRadius.circular(
            context.spaces.space_125,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(
                context.spaces.space_75,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: context.colors.primary,
                  borderRadius: BorderRadius.circular(context.spaces.space_75),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: onpressed,

                    //  () => selectDate(context, ref),
                    icon: const Icon(Icons.date_range),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: context.spaces.space_200),
              child: Text(
                '${now.day}/${now.month}/${now.year}',
                style: context.typography.bodySemibold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}