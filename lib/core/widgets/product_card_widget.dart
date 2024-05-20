import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';

class ProductCardWidget extends ConsumerWidget {
  final String productName;
  final double price;
  final String productLocation;
  final double distance;
  final String img;
  final Function() onTap;
  final String belowbtn;

  const ProductCardWidget({
    super.key,
    required this.productName,
    required this.price,
    required this.productLocation,
    required this.distance,
    required this.img,
    required this.onTap,
    required this.belowbtn,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);

    return InkWell(
      borderRadius:
          BorderRadius.all(Radius.circular(apptheme.spaces.space_200)),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [apptheme.shadows.primary],
          borderRadius: BorderRadius.circular(
            apptheme.spaces.space_200,
          ),
          color: apptheme.colors.cardBackground,
        ),
        width: double.infinity,
        // height: 200,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: apptheme.spaces.space_300 * 4,
                height: apptheme.spaces.space_400,
                decoration: BoxDecoration(
                  color: apptheme.colors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(apptheme.spaces.space_200),
                    bottomRight: Radius.circular(apptheme.spaces.space_200),
                  ),
                ),
                child: Center(
                    child: Text(
                  belowbtn,
                  style: apptheme.typography.buttonText,
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(apptheme.spaces.space_100),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(img), fit: BoxFit.cover),
                          borderRadius:
                              BorderRadius.circular(apptheme.spaces.space_100),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: apptheme.spaces.space_100,
                              left: apptheme.spaces.space_100,
                              child: CircleAvatar(
                                radius: 17,
                                backgroundColor:
                                    AppColorPalettes.white500.withOpacity(0.4),
                                child: const Icon(
                                  Icons.favorite,
                                  color: AppColorPalettes.white500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: apptheme.spaces.space_100,
                            left: apptheme.spaces.space_100,
                            right: apptheme.spaces.space_100),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    productName,
                                    style: apptheme.typography.h3SemiBold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style:
                                        apptheme.typography.bodyLargeSemiBold,
                                    children: [
                                      TextSpan(text: '$price'),
                                      TextSpan(
                                        text: '/Day',
                                        style: apptheme.typography.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: apptheme.spaces.space_125,
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.place_outlined,
                                    size: 20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: apptheme.spaces.space_50,
                                        right: apptheme.spaces.space_100),
                                    child: Text(productLocation),
                                  ),
                                  Text('$distance Km away')
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
