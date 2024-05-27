import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/filters_sort_constants/filter_sort.dart';
import 'package:rent_hub/core/constants/home_screen_constants/home_screen.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/product_card_widget.dart';
import 'package:rent_hub/features/authentication/view/widgets/category_list_builder_widget.dart';
import 'package:rent_hub/features/authentication/view/widgets/sliverAppbar_widget.dart';
import 'package:rent_hub/features/authentication/view/widgets/tabbar_widget.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 5);
    final categoryList = ref.watch(filterSortConstantsProvider).productType;

    // sample
    final List products = [
      [
        'Fortuner',
        3000.00,
        'kasargod',
        22.00,
        'https://imgd.aeplcdn.com/1200x900/n/cw/ec/44709/fortuner-exterior-right-front-three-quarter-20.jpeg?isig=0&q=80',
      ],
      [
        'Fortuner',
        3000.00,
        'kasargod',
        22.00,
        'https://imgd.aeplcdn.com/1200x900/n/cw/ec/44709/fortuner-exterior-right-front-three-quarter-20.jpeg?isig=0&q=80',
      ],
      [
        'Fortuner',
        3000.00,
        'kasargod',
        22.00,
        'https://imgd.aeplcdn.com/1200x900/n/cw/ec/44709/fortuner-exterior-right-front-three-quarter-20.jpeg?isig=0&q=80',
      ],
      [
        'Fortuner',
        3000.00,
        'kasargod',
        22.00,
        'https://imgd.aeplcdn.com/1200x900/n/cw/ec/44709/fortuner-exterior-right-front-three-quarter-20.jpeg?isig=0&q=80',
      ]
    ];

    return RefreshIndicator(
      onRefresh: () async {
        return null;
      },
      child: Scaffold(
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
            SliverAppbarWidget(
              currentLocTitle: 'koyikod',
              stateCountrySubtitle: 'kerala ,india',
              notificationbtnOnTap: () {},
              searchbtnOnTap: () {},
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
          body: TabBarView(
            controller: tabController,
            children: [
              CategoryListBuilderWidget(
                poductsList: products,
                onTap: () {},
              ),
              CategoryListBuilderWidget(
                poductsList: [
                  [
                    'Fortuner',
                    4000.00,
                    'kasargod',
                    22.00,
                    'https://www.livemint.com/lm-img/img/2023/03/26/1600x900/2-0-1412968002-Toyota-Fortuner2-0_1679755299241_1679801994107_1679801994107.jpg',
                  ],
                  [
                    'Fortuner',
                    4000.00,
                    'kasargod',
                    22.00,
                    'https://www.livemint.com/lm-img/img/2023/03/26/1600x900/2-0-1412968002-Toyota-Fortuner2-0_1679755299241_1679801994107_1679801994107.jpg',
                  ],
                  [
                    'Fortuner',
                    4000.00,
                    'kasargod',
                    22.00,
                    'https://www.livemint.com/lm-img/img/2023/03/26/1600x900/2-0-1412968002-Toyota-Fortuner2-0_1679755299241_1679801994107_1679801994107.jpg',
                  ],
                  [
                    'Fortuner',
                    4000.00,
                    'kasargod',
                    22.00,
                    'https://www.livemint.com/lm-img/img/2023/03/26/1600x900/2-0-1412968002-Toyota-Fortuner2-0_1679755299241_1679801994107_1679801994107.jpg',
                  ],
                ],
                onTap: () {},
              ),
              CategoryListBuilderWidget(
                poductsList: products,
                onTap: () {},
              ),
              CategoryListBuilderWidget(
                poductsList: products,
                onTap: () {},
              ),
              CategoryListBuilderWidget(
                poductsList: products,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
