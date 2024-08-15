import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/favourites/favourites.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/widgets/product_card_widget.dart';
import 'package:rent_hub/features/favorites/controller/favorite_ads_controller.dart';
import 'package:rent_hub/features/favorites/controller/get_all_favorite_ads_controller.dart';
import 'package:rent_hub/features/favorites/view/widgets/no_favorites_widget.dart';
import 'package:rent_hub/features/navigation/view/pages/navigation_page.dart';

class FavoritesPage extends HookConsumerWidget {
  const FavoritesPage({super.key});
  static final routePath = '/favoritespage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavBarHeight = useState<double>(0);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        bottomNavBarHeight.value = (NavigationPage
                    .bottomNavBarKey.currentContext?.size?.height ??
                0.0) +
            (NavigationPage.floatingActionBtnKey.currentContext?.size?.height ??
                    0.0) /
                2;
      });

      return null;
    }, []);
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
                      itemCount: data.length + 1,
                      itemBuilder: (context, index) {
                        if (index == data.length) {
                          return SizedBox(
                            height: bottomNavBarHeight.value,
                          );
                        }
                        final adsModel = data[index];
                        return ProductCardWidget(
                          isFavorite: true,
                          onFavoriteTap: () async {
                            /// set favorite method
                            /// add or remove from favorite colloction accordingly
                            /// and invalidate provider which gives all favorite ads user
                            await ref
                                .watch(favoriteAdsProvider.notifier)
                                .setFavorite(adId: data[index].id!);

                            ref.invalidate(getFavoriteProvider);
                          },
                          name: adsModel.productName,
                          price: adsModel.price,
                          location: adsModel.locationTitle,
                          image: adsModel.imagePath[0],
                          onTap: () {},
                          actionBtnLabel: "Rent Now",
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: context.spaces.space_200,
                      ),
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
