import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/features/ads/controller/image_controller/image_provider.dart';
import 'package:rent_hub/features/ads/view/widgets/add_product_page/image_widget.dart';

class ImageSelectorWidget extends ConsumerWidget {
  const ImageSelectorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 80,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.only(left: context.spaces.space_100),
          child: Wrap(
            spacing: context.spaces.space_100,
            children: [
              Imagewidget(
                isLoading: ref.read(imageProvider).isLoading,
                onTap: () async {
                  // image picker
                  ref.read(imageProvider.notifier).upload();
                },
              ),
              // uploaded images list
              ...ref
                  .watch(imageProvider)
                  .imageRefList
                  .map(
                    (imagePath) => Imagewidget(
                      imagePath: imagePath,
                      removeTap: () {
                        ref
                            .read(imageProvider.notifier)
                            .delete(imageRef: imagePath);
                      },
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
