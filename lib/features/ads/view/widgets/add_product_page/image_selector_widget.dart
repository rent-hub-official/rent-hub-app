import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/features/ads/view/widgets/add_product_page/image_widget.dart';

class ImageSelectorWidget extends HookConsumerWidget {
  final ValueNotifier<List<String>> imagesState;

  const ImageSelectorWidget({
    required this.imagesState,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> pickImage() async {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        imagesState.value = [...imagesState.value, pickedFile.path];
      }
    }

    return SizedBox(
      height: 80,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.only(left: context.spaces.space_100),
          child: Wrap(
            spacing: context.spaces.space_100,
            children: [
              /// Pick a new image
              Imagewidget(
                onTap: pickImage,
              ),

              /// Show already picked images
              for (int i = 0; i < imagesState.value.length; i++)
                Imagewidget(
                  imagePath: imagesState.value[i],
                  removeTap: () {
                    imagesState.value = [...imagesState.value]..removeAt(i);
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
