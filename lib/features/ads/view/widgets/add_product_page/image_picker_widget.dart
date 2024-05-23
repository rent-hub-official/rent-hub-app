import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class ImagePickerwidget extends StatelessWidget {
  final void Function()? onTap;
  const ImagePickerwidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: context.spaces.space_900,
          height: context.spaces.space_900,
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}
