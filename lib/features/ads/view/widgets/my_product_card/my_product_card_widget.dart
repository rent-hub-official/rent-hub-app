import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/ads/my_products_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/features/ads/controller/my_products_controller/my_products_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyProductCardWidget extends ConsumerWidget {
  const MyProductCardWidget(
      {super.key,
      required this.Productimage,
      required this.productName,
      required this.poductPrice,
      required this.description,
      required this.id,

      // required this.views,
      // required this.likes,
      required this.onSelected,
      required this.editonTap,
      required this.myProductsOnTap});

  final String Productimage;
  final String productName;
  final double poductPrice;
  final String description;
  final String id;
  // final int views;
  // final int likes;
  final void Function(String)? onSelected;
  final void Function() myProductsOnTap;
  final void Function() editonTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: myProductsOnTap,
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
                    Productimage,
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
                    onSelected: onSelected,
                    icon: Icon(Icons.more_vert),
                    iconColor: AppColorPalettes.white500,
                    color: AppColorPalettes.white500.withOpacity(0.7),
                    elevation: 1,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: ref.watch(myProductsConstantsProvider).txtDelete,
                        child: InkWell(
                          onTap: () {
                            ref
                                .watch(myProductsProvider.notifier)
                                .deleteMyProduct(id: id);
                            ref.invalidate(myProductsProvider);
                          },
                          child: Text(
                            ref.watch(myProductsConstantsProvider).txtDelete,
                            style: context.typography.body.copyWith(
                              color: AppColorPalettes.black500,
                            ),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: ref.watch(myProductsConstantsProvider).txtDelete,
                        child: InkWell(
                          onTap: editonTap,
                          child: Text(
                            ref.watch(myProductsConstantsProvider).txtEdit,
                            style: context.typography.body
                                .copyWith(color: AppColorPalettes.black500),
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: ref.watch(myProductsConstantsProvider).txtDelete,
                        child: InkWell(
                          onTap: () async {
                            await launchUrlString("https://www.instagram.com/");
                          },
                          child: Text(
                            ref.watch(myProductsConstantsProvider).txtShare,
                            style: context.typography.body.copyWith(
                              color: AppColorPalettes.black500,
                            ),
                          ),
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
                  productName,
                  style: context.typography.h3SemiBold,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  description,
                  style: context.typography.body,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            // height space

            Row(
              children: [
                Spacer(),
                // price
                RichText(
                  text: TextSpan(
                    style: context.typography.bodyLargeSemiBold,
                    children: [
                      TextSpan(
                          text:
                              '${ref.watch(myProductsConstantsProvider).txtRupay} $poductPrice'),
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
