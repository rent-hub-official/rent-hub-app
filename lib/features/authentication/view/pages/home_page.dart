import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/filters_sort_constants/filter_sort.dart';
import 'package:rent_hub/core/constants/home_screen_constants/home_screen.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/product_card_widget.dart';
import 'package:rent_hub/features/authentication/view/widgets/sliverAppbar_widget.dart';
import 'package:rent_hub/features/authentication/view/widgets/tabbar_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        // Handle tab selection here
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> categoryList =
        ref.read(filterSortConstantsProvider).productType;

    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            // todo refresh indicator logic
            return null;
          },
          child: NestedScrollView(
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
                        tabController: tabController,
                        categoryList: categoryList),
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
                ListView.builder(
                  padding: EdgeInsets.zero, // Remove top padding
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.spaces.space_200,
                        vertical:
                            context.spaces.space_100, // Add vertical padding
                      ),
                      child: ProductCardWidget(
                        productName: 'Fortuner',
                        price: 3000,
                        productLocation: 'kasargod',
                        distance: 22,
                        img:
                            'https://imgd.aeplcdn.com/1200x900/n/cw/ec/44709/fortuner-exterior-right-front-three-quarter-20.jpeg?isig=0&q=80',
                        onTap: () {},
                        belowbtn: 'rent bow',
                      ),
                    );
                  },
                  itemCount: 22,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.black,
                ),
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.purple,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
