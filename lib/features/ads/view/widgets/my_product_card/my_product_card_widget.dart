import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/ads/my_products_constants.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/features/ads/controller/my_products_controller/my_products_controller.dart';
import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/features/ads/view/pages/add_product_page.dart';
import 'package:rent_hub/features/ads/view/pages/product_details_page/product_details_page.dart';
import 'package:share_plus/share_plus.dart';

class MyProductCardWidget extends ConsumerWidget {
  const MyProductCardWidget({super.key, required this.ad});

  final AdsModel ad;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(myProductsConstantsProvider);

    Future<void> deleteProductBtnCallback() async {
      ref.read(myProductsProvider.notifier).deleteMyProduct(id: ad.id!);

      ref.invalidate(myProductsProvider);
    }

    Future<void> editProductBtnCallback() async {
      context.push(AddProductPage.routePath, extra: ad);
    }

    Future<void> shareProductBtnCallback() async {
      final result = await Share.share(
        'Check out this product on RentHub  ${ad.productName} for just ${ad.price} per day',
      );

      if (result.status == ShareResultStatus.success) {
        log('Product shared successfully');
      }
    }

    return GestureDetector(
      onTap: () {
        context.push(ProductDetailsPage.routePath, extra: ad);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(context.spaces.space_150),
        decoration: BoxDecoration(
          boxShadow: [context.shadows.primary, context.shadows.secondary],
          borderRadius: BorderRadius.circular(
            context.spaces.space_200,
          ),
          color: context.colors.cardBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image container
            Container(
              width: double.infinity,
              height: context.spaces.space_400 * 4,
              padding: EdgeInsets.symmetric(
                horizontal: context.spaces.space_200,
                vertical: context.spaces.space_150,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    ad.imagePath.first,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(context.spaces.space_100),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: context.spaces.space_250,
                  backgroundColor: AppColorPalettes.white500.withOpacity(0.2),
                  child: PopupMenuButton(
                    onSelected: (value) {
                      if (value == constants.txtDelete) {
                        deleteProductBtnCallback();
                      } else if (value == constants.txtEdit) {
                        editProductBtnCallback();
                      } else if (value == constants.txtShare) {
                        shareProductBtnCallback();
                      }
                    },
                    icon: Icon(Icons.more_vert),
                    elevation: 1,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: constants.txtDelete,
                        child: Text(
                          constants.txtDelete,
                          style: context.typography.body,
                        ),
                      ),
                      PopupMenuItem(
                        value: constants.txtEdit,
                        child: Text(
                          ref.read(myProductsConstantsProvider).txtEdit,
                          style: context.typography.body,
                        ),
                      ),
                      PopupMenuItem(
                        value: constants.txtShare,
                        child: Text(
                          constants.txtShare,
                          style: context.typography.body,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // height space
            SizedBox(
              height: context.spaces.space_125,
            ),
            // product name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ad.productName,
                  style: context.typography.h3SemiBold,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: context.spaces.space_100,
                ),
                Row(
                  children: [
                    Icon(Icons.location_on),
                    Text(
                      ad.locationTitle,
                      style: context.typography.body,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),

            Row(
              children: [
                Spacer(),
                // price
                RichText(
                  text: TextSpan(
                    style: context.typography.bodyLargeSemiBold,
                    children: [
                      TextSpan(text: '${constants.txtRupay} ${ad.price}'),
                      TextSpan(
                        text: '/Day',
                        style: context.typography.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
