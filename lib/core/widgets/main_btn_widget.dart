import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:shimmer/shimmer.dart';

class PrimaryBtnWidget extends StatelessWidget {
  final Function() onTap;
  final String label;
  final bool isLoading;

  const PrimaryBtnWidget({
    super.key,
    required this.onTap,
    required this.label,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
            child: Container(
              width: double.infinity,
              height: context.spaces.space_600,
              decoration: BoxDecoration(
                color: context.colors.primary,
                borderRadius: BorderRadius.circular(context.spaces.space_100),
              ),
            ),
            baseColor: context.colors.primary,
            highlightColor: context.colors.primary.withOpacity(0.5),
          )
        : SizedBox(
            width: double.infinity,
            height: context.spaces.space_600,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                backgroundColor: context.colors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(context.spaces.space_100),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: context.spaces.space_200,
                  vertical: context.spaces.space_100,
                ),
              ),
              child: Text(
                label,
                style: context.typography.buttonText,
              ),
            ),
          );
  }
}
