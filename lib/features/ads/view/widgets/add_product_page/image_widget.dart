import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:shimmer/shimmer.dart';

class Imagewidget extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? removeTap;
  final String? imagePath;
  final bool isLoading;

  const Imagewidget({
    super.key,
    this.onTap,
    this.removeTap,
    this.imagePath,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      child: Stack(
        children: [
          SizedBox(
            width: 80,
            height: 80,
          ),
          isLoading
              ? Positioned(
                  bottom: 0,
                  child: Shimmer.fromColors(
                    baseColor: AppColorPalettes.grey350,
                    highlightColor: AppColorPalettes.white500,
                    child: Positioned(
                      bottom: 0,
                      child: Container(
                        width: context.spaces.space_900,
                        height: context.spaces.space_900,
                        decoration: BoxDecoration(
                          color: AppColorPalettes.white100,
                          borderRadius:
                              BorderRadius.circular(context.spaces.space_50),
                        ),
                      ),
                    ),
                  ),
                )
              : Positioned(
                  bottom: 0,
                  child: Container(
                    width: context.spaces.space_900,
                    height: context.spaces.space_900,
                    decoration: BoxDecoration(
                      color: AppColorPalettes.white100,
                      image: imagePath != null
                          ? DecorationImage(
                              image: NetworkImage(imagePath!),
                              fit: BoxFit.cover,
                            )
                          : null,
                      borderRadius:
                          BorderRadius.circular(context.spaces.space_50),
                    ),
                    child:
                        imagePath != null ? null : const Icon(Icons.camera_alt),
                  ),
                ),
          removeTap != null
              ? Positioned(
                  right: 0,
                  top: 0,
                  child: InkWell(
                    onTap: removeTap,
                    child: CircleAvatar(
                      backgroundColor: AppColorPalettes.red500,
                      radius: 12,
                      child: Icon(
                        Icons.close,
                        size: 12,
                        color: AppColorPalettes.white500,
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
