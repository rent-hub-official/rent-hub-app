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
import 'package:shimmer/shimmer.dart';

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
    final productsState = ref.watch(fetchProductsProvider(
      catagory: categoryName,
    ));

    if (productsState.products != null) {
      final productsList = productsState.products!;

      /// Empty products list check
      if (productsList.isEmpty) {
        return LayoutBuilder(
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

      /// Show products list
      return NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) {
          if (notification.metrics.extentAfter < 10) {
            ref
                .read(fetchProductsProvider(catagory: categoryName).notifier)
                .fetchNextPageData();
          }

          return true;
        },
        child: ListView.builder(
          /// An extra item length is added to show a gap at the end of the list
          itemCount: productsList.length + 1,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            if (index == productsList.length)
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Show a shimmer at the end of the list if new page is about to load
                  if (productsState.isLoading)
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16),
                        child: Container(
                          width: double.infinity,
                          height: 220, // Adjust the height as needed
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                12), // Adjust border radius as needed
                          ),
                        ),
                      ),
                    ),

                  /// To add some extra space to avoid ads card being hidden behind the bottom navigation bar
                  SizedBox(
                    height: bottomNavBarHeight.value,
                  ),
                ],
              );

            //future builder for checks ads if favorite or not
            return FutureBuilder(
                future: ref
                    .read(favoriteAdsProvider.notifier)
                    .isFav(productsList[index].id!),
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
                      name: productsList[index].productName,
                      price: productsList[index].price,
                      isFavorite: snapshot.data!,
                      location: productsList[index].locationTitle,
                      image: productsList[index].imagePath[0],
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
                            .read(favoriteAdsProvider.notifier)
                            .setFavorite(adId: productsList[index].id!);
                      },
                      actionBtnLabel: 'Rent Now',
                    ),
                  );
                });
          },
        ),
      );
    } else if (productsState.error != null) {
      /// Show error message
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ref.read(errorConstantsProvider).txtWentWrong,
              style: context.typography.bodySemibold,
            ),
            IconButton(
              onPressed: () {
                ref.invalidate(fetchProductsProvider(catagory: categoryName));
              },
              icon: Icon(Icons.refresh),
            ),
          ],
        ),
      );
    } else {
      /// Not loaded yet
      return LoadingWidget();
    }
  }
}
