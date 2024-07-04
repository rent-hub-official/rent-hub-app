import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) => Imagewidget(
              imagePath: ref.watch(imageProvider).imageRefList[index],
              removeTap: () {
                ref.read(imageProvider.notifier).delete(
                      imageRef: ref.watch(imageProvider).imageRefList[index],
                    );
              },
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: context.spaces.space_100,
            ),
            itemCount: ref.watch(imageProvider).imageRefList.length,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: context.spaces.space_100,
            ),
            child: Imagewidget(
              isLoading: ref.read(imageProvider).isLoading,
              onTap: () async {
                // image picker
                ref.read(imageProvider.notifier).upload();
              },
            ),
          ),
        ],
      ),
    );
  }
}
