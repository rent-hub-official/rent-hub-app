import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/favourites/favourites.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/product_card_widget.dart';
import 'package:rent_hub/features/favorites/controller/favorite_ads_controller.dart';
import 'package:rent_hub/features/favorites/controller/get_all_favorite_ads_controller.dart';
import 'package:rent_hub/features/favorites/view/widgets/no_favorites_widget.dart';

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});
  static final routePath = '/favoritespage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(favouritesConstantsProvider).txtFavourite),
        titleTextStyle: context.typography.h2Bold,
      ),
      body: ref.watch(getFavoriteProvider).when(
            data: (data) {
              return data.isEmpty
                  ? NoFavoritesWidget()
                  : ListView.separated(
                      padding: EdgeInsets.only(
                        left: context.spaces.space_200,
                        right: context.spaces.space_200,
                        top: context.spaces.space_100,
                      ),
                      itemBuilder: (context, index) {
                        final adsModel = data[index];
                        return ProductCardWidget(
                          isFavorite: true,
                          favoriteTap: () async {
                            /// set favorite method
                            /// add or remove from favorite colloction accordingly
                            /// and invalidate provider which gives all favorite ads user
                            await ref
                                .watch(favoriteAdsProvider.notifier)
                                .setFavorite(adId: data[index].id!);

                            ref.invalidate(getFavoriteProvider);
                          },
                          productName: adsModel.productName,
                          price: adsModel.price,
                          productLocation: adsModel.locationTitle,
                          img: adsModel.imagePath[0],
                          onTap: () {
                            // TODO: rental operation
                          },
                          belowbtn: "Rent Now",
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: context.spaces.space_200,
                      ),
                      itemCount: data.length,
                    );
            },
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
