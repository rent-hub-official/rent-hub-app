import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rent_hub/core/constants/favourites/favourites.dart';
import 'package:rent_hub/core/constants/image_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class NoFavoritesWidget extends ConsumerWidget {
  const NoFavoritesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // image
          SvgPicture.asset(ref.watch(imageConstantsProvider).imgNoFavorites),
          // text
          Text(
            ref.watch(favouritesConstantsProvider).txtNoFavourite,
            style: context.typography.bodyLargeSemiBold,
          )
        ],
      ),
    );
  }
}
