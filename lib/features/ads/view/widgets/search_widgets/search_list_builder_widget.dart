import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/animation_constants.dart';
import 'package:rent_hub/core/constants/error_constants.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/widgets/product_card_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:rent_hub/features/ads/controller/product_controller/fetch_catagary_products_provider.dart';
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
    final seachedProducts = ref.watch(searchAdsProvider);

    return switch (seachedProducts) {
      AsyncData(value: final productsList) =>
        productsList != null && productsList.isNotEmpty
            ? ListView.builder(
                itemCount: productsList.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  //future builder for cehceks ads if favorite or not
                  return FutureBuilder(
                      future: ref
                          .watch(favoriteAdsProvider.notifier)
                          .isFav(productsList[index].id),
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
                            name: productsList[index].data()!.productName,
                            price: productsList[index].data()!.price,
                            isFavorite: snapshot.data!,
                            location: productsList[index].data()!.locationTitle,
                            image: productsList[index].data()!.imagePath[0],
                            onTap: () {
                              //navigate to details page
                              context.push(
                                ProductDetailsPage.routePath,
                                extra: productsList[index],
                              );
                            },
                            onFavoriteTap: () async {
                              /// toggle favorite status
                              /// invalidate provider for rebuild ui
                              await ref
                                  .watch(favoriteAdsProvider.notifier)
                                  .setFavorite(adId: productsList[index].id);

                              ref.invalidate(fetchCatagorisedProductsProvider);
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
              ),
      AsyncError() => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                ref.read(errorConstantsProvider).txtWentWrong,
                style: context.typography.bodySemibold,
              ),
              IconButton(
                onPressed: () {
                  ref.read(searchAdsProvider.notifier).searchAds(queryText);
                },
                icon: Icon(Icons.refresh),
              ),
            ],
          ),
        ),
      _ => Center(
          child: CircularProgressIndicator(),
        )
    };
  }
}
