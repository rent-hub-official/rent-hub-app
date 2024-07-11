import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/animation_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/product_card_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:rent_hub/features/ads/controller/product_controller/fetch_catagary_products_provider.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';
import 'package:rent_hub/features/ads/view/pages/product_details_page/product_details_page.dart';
import 'package:rent_hub/features/favorites/controller/favorite_ads_controller.dart';

class SearchListBuilderWidget extends ConsumerWidget {
  const SearchListBuilderWidget({
    super.key,
    required this.productsList,
  });
// get available data of products
  final List<DocumentSnapshot<AdsModel>> productsList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lottieConsts = ref.read(animationConstantsProvider);

    return productsList.isNotEmpty
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
                        productName: productsList[index].data()!.productName,
                        price: productsList[index].data()!.price,
                        isFavorite: snapshot.data!,
                        productLocation:
                            productsList[index].data()!.locationTitle,
                        distance: productsList[index].data()!.long,
                        img: productsList[index].data()!.imagePath[0],
                        onTap: () {
                          //navigate to details page
                          context.push(
                            ProductDetailsPage.routePath,
                            extra: productsList[index],
                          );
                        },
                        favoriteTap: () async {
                          /// toggle favorite status
                          /// invalidate provider for rebuild ui
                          await ref
                              .watch(favoriteAdsProvider.notifier)
                              .setFavorite(adId: productsList[index].id);

                          ref.invalidate(fetchCatagorisedProductsProvider);
                        },
                        belowbtn: 'rent Now',
                      ),
                    );
                  });
            },
          )
        : LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                child: Lottie.asset(
                  lottieConsts.animationEmpty,
                  height: constraints.maxHeight * .4,
                ),
              );
            },
          );
  }
}
