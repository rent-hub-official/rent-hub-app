import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/animation_constants.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/widgets/product_card_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:rent_hub/features/ads/controller/search_controller/filter_controller.dart';
import 'package:rent_hub/features/ads/controller/search_controller/search_controller.dart';
import 'package:rent_hub/features/ads/view/pages/product_details_page/product_details_page.dart';
import 'package:rent_hub/features/favorites/controller/favorite_ads_controller.dart';

class SearchListBuilderWidget extends ConsumerWidget {
  final String queryText;

  const SearchListBuilderWidget({
    super.key,
    required this.queryText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lottieConsts = ref.read(animationConstantsProvider);
    final searchedProducts = ref.watch(searchAdsProvider);

    /// Watch for any filter changes and reload the UI
    ref.watch(filterControllerProvider);

    return Builder(
      builder: (context) {
        /// Filter the products
        final filteredProducts = ref
            .read(filterControllerProvider.notifier)
            .filterAds(searchedProducts);

        return filteredProducts.isNotEmpty
            ? ListView.builder(
                itemCount: filteredProducts.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  //future builder for cehceks ads if favorite or not
                  return FutureBuilder(
                      future: ref
                          .watch(favoriteAdsProvider.notifier)
                          .isFav(filteredProducts[index].id!),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return Container(
                            height: 100,
                            width: double.infinity,
                            child: Text('ERROR'),
                          );
                        }

                        /// snapshot has no data return circular indicator
                        if (!snapshot.hasData) {
                          return Container(
                            height: 100,
                            width: double.infinity,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }

                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.spaces.space_200,
                            vertical: context.spaces.space_100,
                          ),
                          // product card
                          child: ProductCardWidget(
                            name: filteredProducts[index].productName,
                            price: filteredProducts[index].price,
                            isFavorite: snapshot.data!,
                            location: filteredProducts[index].locationTitle,
                            image: filteredProducts[index].imagePath[0],
                            onTap: () {
                              //navigate to details page
                              context.push(
                                ProductDetailsPage.routePath,
                                extra: filteredProducts[index],
                              );
                            },
                            onFavoriteTap: () async {
                              await ref
                                  .watch(favoriteAdsProvider.notifier)
                                  .setFavorite(
                                      adId: filteredProducts[index].id!);
                            },
                            actionBtnLabel: 'Rent Now',
                          ),
                        );
                      });
                },
              )
            : LayoutBuilder(
                builder: (context, constraints) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          lottieConsts.animationEmpty,
                          height: constraints.maxHeight * .4,
                        ),
                        SizedBox(height: context.spaces.space_200),
                        Text(
                          'Nothing found',
                          style: context.typography.bodyLargeSemiBold,
                        ),
                      ],
                    ),
                  );
                },
              );
      },
    );
  }
}
