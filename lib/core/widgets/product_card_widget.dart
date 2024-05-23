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
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(context.spaces.space_200)),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [context.shadows.primary, context.shadows.secondary],
          borderRadius: BorderRadius.circular(
            context.spaces.space_200,
          ),
          color: context.colors.cardBackground,
        ),
        width: double.infinity,
        // height: 200,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: context.spaces.space_300 * 4,
                height: context.spaces.space_400,
                decoration: BoxDecoration(
                  color: context.colors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(context.spaces.space_200),
                    bottomRight: Radius.circular(context.spaces.space_200),
                  ),
                ),
                child: Center(
                    child: Text(
                  belowbtn,
                  style: context.typography.buttonText,
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(context.spaces.space_100),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: context.spaces.space_400 * 4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(img), fit: BoxFit.cover),
                          borderRadius:
                              BorderRadius.circular(context.spaces.space_100),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: context.spaces.space_100,
                              left: context.spaces.space_100,
                              child: CircleAvatar(
                                radius: context.spaces.space_200,
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
                            top: context.spaces.space_100,
                            left: context.spaces.space_100,
                            right: context.spaces.space_100),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    productName,
                                    style: context.typography.h3SemiBold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: context.typography.bodyLargeSemiBold,
                                    children: [
                                      TextSpan(text: '$price'),
                                      TextSpan(
                                        text: '/Day',
                                        style: context.typography.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: context.spaces.space_125,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.place_outlined,
                                    size: context.spaces.space_250,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: context.spaces.space_50,
                                        right: context.spaces.space_100),
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
