import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/error_constants.dart';
import 'package:rent_hub/core/constants/ads/filter_sort.dart';
import 'package:rent_hub/core/constants/ads/home_screen.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/features/ads/controller/category_controller/category_provider.dart';
import 'package:rent_hub/features/ads/controller/product_controller/fetch_catagary_products_provider.dart';
import 'package:rent_hub/features/ads/view/widgets/home_widgets/category_list_builder_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/home_widgets/home_app_bar_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/home_widgets/tab_bar_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/product_card_shimmer/product_card_shimmer_widget.dart';

class HomePage extends HookConsumerWidget {
  static const routePath = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// List of available category
    final categoryList = ref.watch(filterSortConstantsProvider).productType;

    /// Controler used for the tab view.
    final tabController = useTabController(initialLength: categoryList.length);

    // update when tabs changes
    tabController.addListener(() {
      ref.watch(categoryItemSelectedIndexProvider.notifier).state =
          tabController.index;
    });

    /// Get the ads that are part of the selected category.
    ///
    /// If the selected category index is 0, then we need to fetch all the ads.
    /// Otherwise we will fetch the ads of the selected category name
    final products = ref.watch(fetchCatagorisedProductsProvider(
      catagory: ref.watch(categoryItemSelectedIndexProvider) != 0
          ? categoryList[ref.watch(categoryItemSelectedIndexProvider)]
          : null,
    ));

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
          HomeAppBarWidget(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBarWidget(
                    tabController: tabController, categoryList: categoryList),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.spaces.space_200,
                    vertical: context.spaces.space_200,
                  ),
                  child: Text(
                    ref.watch(homeScreenConstantsProvider).txtsub,
                    style: context.typography.bodySemibold,
                  ),
                ),
              ],
            ),
          ),
        ],
        body: TabBarView(
          controller: tabController,
          children: [
            // category List
            for (int i = 0; i < categoryList.length; i++)
              RefreshIndicator(
                  onRefresh: () async {
                    // refresh fetch products
                    ref.invalidate(fetchCatagorisedProductsProvider);
                    return Future.delayed(Duration(seconds: 1));
                  },
                  child: products.when(
                    skipLoadingOnRefresh: true,
                    data: (data) {
                      return CategoryListBuilderWidget(
                        productsList: data,
                      );
                    },
                    error: (error, stackTrace) {
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
                                ref.invalidate(
                                    fetchCatagorisedProductsProvider);
                              },
                              icon: Icon(Icons.refresh),
                            ),
                          ],
                        ),
                      );
                    },
                    loading: () => LoadingWidget(),
                  )),
          ],
        ),
      ),
    );
  }
}
