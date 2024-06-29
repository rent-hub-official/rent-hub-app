import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class Imagewidget extends StatelessWidget {
  final void Function()? onTap;
  final String? imagePath;
  const Imagewidget({
    super.key,
    this.onTap,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: context.spaces.space_900,
          height: context.spaces.space_900,
          decoration: imagePath != null
              ? BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imagePath!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(context.spaces.space_50))
              : null,
          child: imagePath != null ? null : const Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}
