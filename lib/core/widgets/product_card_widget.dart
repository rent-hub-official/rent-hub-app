import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/theme/color_palette.dart';

class ProductCardWidget extends HookConsumerWidget {
  final String name;
  final double price;
  final String location;
  final String image;
  final VoidCallback onTap;
  final String actionBtnLabel;
  final bool isFavorite;
  final Future<void> Function()? onFavoriteTap;

  const ProductCardWidget({
    super.key,
    required this.name,
    required this.price,
    required this.location,
    required this.image,
    required this.onTap,
    required this.actionBtnLabel,
    this.isFavorite = false,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = useState(this.isFavorite);

    return InkWell(
      borderRadius: BorderRadius.circular(context.spaces.space_200),
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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(context.spaces.space_100),
                  child: Container(
                    width: double.infinity,
                    height: context.spaces.space_400 * 4,
                    padding: EdgeInsets.all(context.spaces.space_100),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.cover),
                      borderRadius:
                          BorderRadius.circular(context.spaces.space_100),
                    ),
                    child: onFavoriteTap == null
                        ? null
                        : Align(
                            alignment: Alignment.topLeft,
                            child: InkWell(
                              onTap: () async {
                                await onFavoriteTap?.call();
                                isFavorite.value = !isFavorite.value;
                              },
                              child: CircleAvatar(
                                radius: context.spaces.space_200,
                                backgroundColor: context
                                    .colors.messageBackground
                                    .withAlpha(100),
                                child: Center(
                                  child: Icon(
                                    Icons.favorite,
                                    color: isFavorite.value
                                        ? AppColorPalettes.red500
                                        : AppColorPalettes.white500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
                SizedBox(height: context.spaces.space_100),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.spaces.space_100),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: context.typography.h3SemiBold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: context.typography.bodyLargeSemiBold,
                          children: [
                            TextSpan(text: '₹ $price'),
                            TextSpan(
                              text: '/day',
                              style: context.typography.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: context.spaces.space_100),
                Row(
                  children: [
                    SizedBox(width: context.spaces.space_100),
                    Icon(
                      Icons.place_outlined,
                      size: context.spaces.space_200,
                    ),
                    SizedBox(
                      width: context.spaces.space_50,
                    ),
                    Expanded(
                      child: Text(
                        location,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: context.spaces.space_100),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.spaces.space_300,
                        vertical: context.spaces.space_100,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(context.spaces.space_200),
                          bottomRight:
                              Radius.circular(context.spaces.space_200),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          actionBtnLabel,
                          style: context.typography.buttonText,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
