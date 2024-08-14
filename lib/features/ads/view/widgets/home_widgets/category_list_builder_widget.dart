import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/animation_constants.dart';
import 'package:rent_hub/core/constants/error_constants.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/widgets/product_card_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:rent_hub/features/ads/controller/product_controller/fetch_catagary_products_provider.dart';
import 'package:rent_hub/features/ads/view/pages/product_details_page/product_details_page.dart';
import 'package:rent_hub/features/ads/view/widgets/product_card_shimmer/product_card_shimmer_widget.dart';
import 'package:rent_hub/features/favorites/controller/favorite_ads_controller.dart';
import 'package:rent_hub/features/navigation/view/pages/navigation_page.dart';

class CategoryListBuilderWidget extends HookConsumerWidget {
  final String? categoryName;

  const CategoryListBuilderWidget({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavBarHeight = useState<double>(0);
    final lottieConsts = ref.read(animationConstantsProvider);

    /// Get the height of the bottom navigation bar to add padding to the bottom
    /// of the list
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

    /// Get the ads that are part of the selected category.
    ///
    /// If the category name is null, then fetch all category products
    final products = ref.watch(fetchCatagorisedProductsProvider(
      catagory: categoryName,
    ));

    return switch (products) {
      AsyncData(value: final productsList) => productsList.isNotEmpty
          ? ListView.builder(
              itemCount: productsList.length + 1,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                if (index == productsList.length) {
                  return SizedBox(
                    height: bottomNavBarHeight.value,
                  );
                }

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
                          child: LoadingWidget(),
                        );
                      }

                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.spaces.space_200,
                          vertical: context.spaces.space_100,
                        ),
                        // product card
                        child: ProductCardWidget(
                          name: productsList[index].data().productName,
                          price: productsList[index].data().price,
                          isFavorite: snapshot.data!,
                          location: productsList[index].data().locationTitle,
                          image: productsList[index].data().imagePath[0],
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
                          actionBtnLabel: 'rent Now',
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
                  ref.invalidate(fetchCatagorisedProductsProvider);
                },
                icon: Icon(Icons.refresh),
              ),
            ],
          ),
        ),
      _ => LoadingWidget(),
    };
  }
}
