import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/error_constants/error_constants.dart';
import 'package:rent_hub/core/constants/filters_sort_constants/filter_sort.dart';
import 'package:rent_hub/core/constants/home_screen_constants/home_screen.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/features/ads/controller/category_controller/category_provider.dart';
import 'package:rent_hub/features/ads/controller/get_products_controller/fetch_catagary_products_provider.dart';
import 'package:rent_hub/features/ads/view/pages/notification_page.dart';
import 'package:rent_hub/features/ads/view/widgets/home_widgets/category_list_builder_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/home_widgets/sliverAppbar_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/home_widgets/tabbar_widget.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  static const routePath = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // tab controller
    final tabController = useTabController(initialLength: 5);
    // List of available category
    final categoryList = ref.watch(filterSortConstantsProvider).productType;

// update when tabs changes
    tabController.addListener(
      () {
        ref.watch(categoryItemSelectedIndexProvider.notifier).state =
            tabController.index;
      },
    );

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          // refresh products provider
          ref.invalidate(fetchCatagorisedProductsProvider);
          // invalidate selected index provider for tabbar
          ref.invalidate(categoryItemSelectedIndexProvider);
          return null;
        },
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
            SliverAppbarWidget(
              // TODO change location details
              currentLocTitle: 'kozhikode',
              stateCountrySubtitle: 'kerala ,india',
              notificationbtnOnTap: () {
                context.push(NotificationPage.routePath);
              },
              searchBtnOnTap: () {
                // TODO :
              },
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabbarWidget(
                      tabController: tabController, categoryList: categoryList),
                  Padding(
                    padding: EdgeInsets.only(
                        left: context.spaces.space_200,
                        right: context.spaces.space_200,
                        top: context.spaces.space_200,
                        bottom: context.spaces.space_200),
                    child: Text(
                      ref.watch(homeScreenProvider).txtsub,
                      style: context.typography.bodySemibold,
                    ),
                  ),
                ],
              ),
            ),
          ],
          // categrised products details
          // return null when selected category is ALL
          body: ref
              .watch(fetchCatagorisedProductsProvider(
                  context: context,
                  catagory: ref.watch(categoryItemSelectedIndexProvider) != 0
                      ? categoryList[
                          ref.watch(categoryItemSelectedIndexProvider)]
                      : null))
              .when(
                data: (data) {
                  return TabBarView(
                    controller: tabController,
                    children: [
                      // category List
                      for (int i = 0; i < categoryList.length; i++)
                        CategoryListBuilderWidget(
                          poductsList: data,
                        ),
                    ],
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
                        // refresh button when error shown
                        IconButton(
                          onPressed: () {
                            ref.invalidate(fetchCatagorisedProductsProvider);
                          },
                          icon: Icon(
                            Icons.refresh,
                          ),
                        )
                      ],
                    ),
                  );
                },
                // loading widget
                loading: () => Center(child: CircularProgressIndicator()),
              ),
        ),
      ),
    );
  }
}
