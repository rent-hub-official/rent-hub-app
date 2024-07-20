import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:shimmer/shimmer.dart';

class PlacesTileLoadingWidget extends StatelessWidget {
  const PlacesTileLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Shimmer.fromColors(
        baseColor: AppColorPalettes.white100,
        highlightColor: AppColorPalettes.grey100,
        child: Container(
          width: 40,
          height: 40,
          color: AppColorPalettes.white500,
        ),
      ),
      title: Shimmer.fromColors(
        baseColor: AppColorPalettes.white100,
        highlightColor: AppColorPalettes.grey100,
        child: Container(
          width: double.infinity,
          height: 10,
          color: AppColorPalettes.white500,
        ),
      ),
      subtitle: Shimmer.fromColors(
        baseColor: AppColorPalettes.white100,
        highlightColor: context.colors.cardBackground,
        child: Container(
          width: double.infinity,
          height: 10,
          color: AppColorPalettes.white500,
        ),
      ),
    );
  }
}
