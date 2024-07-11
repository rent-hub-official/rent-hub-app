import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/ads/purchase_history.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/widgets/product_card_widget.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/orders/controller/fetch_ads_provider.dart';
import 'package:rent_hub/features/orders/controller/orders_provider.dart';

class HistoryDetailsPage extends HookConsumerWidget {
  static const routePath = '/historydetailspage';

  HistoryDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // purchase history constants
    final purchaseConsts = ref.read(purchaseHistoryConstantsProvider);

    // selected tab
    final selectedTabIndex = useState<int>(0);

    ///tabbar controller
    final TabController tabController = useTabController(initialLength: 2);
    // change selected tab index accordingly
    tabController.addListener(
      () {
        selectedTabIndex.value = tabController.index;
      },
    );

    final orders = ref.watch(ordersProvider).value;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: context.spaces.space_150),
          child: RoundedIconButton(
              onTap: () {
                //  navigate previos page
                context.pop();
              },
              icon: Icons.chevron_left),
        ),
        title: Text(
          purchaseConsts.txtHeading,
          style: context.typography.h2Bold,
        ),
        // Tabbar
        bottom: TabBar(
          controller: tabController,
          splashFactory: NoSplash.splashFactory,
          dividerColor: Colors.transparent,
          labelColor: context.colors.cardBackground,
          indicator: BoxDecoration(
            color: context.colors.secondary,
            borderRadius: BorderRadius.circular(context.spaces.space_200),
          ),
          tabs: [
            Container(
              decoration: BoxDecoration(
                  //choose background color of the tab
                  color: selectedTabIndex.value == 1
                      ? context.colors.cardBackground
                      : Colors.transparent,
                  borderRadius:
                      BorderRadius.circular(context.spaces.space_200)),
              height: context.spaces.space_500,
              width: double.infinity,
              child: Center(
                  child: Text(
                purchaseConsts.txtHeading,
                style: selectedTabIndex.value == 1
                    ? context.typography.body
                    : context.typography.bodyWhite,
              )),
            ),
            Container(
              decoration: BoxDecoration(
                color: selectedTabIndex.value == 0
                    ? context.colors.cardBackground
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(context.spaces.space_200),
              ),
              height: context.spaces.space_500,
              width: double.infinity,
              child: Center(
                child: Text(
                  purchaseConsts.txtBookingHistory,
                  //choose background color of the tab
                  style: selectedTabIndex.value == 0
                      ? context.typography.body
                      : context.typography.bodyWhite,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.spaces.space_200),
        child: TabBarView(
          controller: tabController,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: orders!.length,
              itemBuilder: (context, index) {
                final productModelSample = ref
                    .watch(FetchAdsWithIdProvider(id: orders[index].adsId))
                    .value!
                    .data();

                return Padding(
                  padding: EdgeInsets.only(top: context.spaces.space_150),
                  child: Stack(
                    children: [
                      ProductCardWidget(
                          productName: productModelSample!.productName,
                          price: productModelSample.price,
                          productLocation: productModelSample.locationTitle,
                          distance: 1,
                          img: productModelSample.imagePath[0],
                          onTap: () {},
                          belowbtn: ''),
                      Positioned(
                        top: context.spaces.space_400,
                        right: -40,
                        child: Transform.rotate(
                          // angle coverted to radius
                          angle: context.spaces.space_600 * (3.14159 / 180),
                          child: Container(
                            width: context.spaces.space_900 * 2,
                            height: context.spaces.space_250,
                            // label color
                            color: orders[index].status ==
                                    purchaseConsts.txtCompleted
                                ? AppColorPalettes.green
                                : AppColorPalettes.blue,
                            child: Center(
                              child: Text(
                                // choose label text accordingly
                                orders[index].status ==
                                        purchaseConsts.txtCompleted
                                    ? purchaseConsts.txtCompleted
                                    : purchaseConsts.txtPending,
                                style: context.typography.bodyWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// change sample model classs : TODO
class ProductModelSample {
  final bool? isCompleted;
  final String productName;
  final double price;
  final String productLocation;
  final double distance;
  final String img;
  final Function() onTap;
  final String belowbtn;

  const ProductModelSample({
    this.isCompleted,
    required this.productName,
    required this.price,
    required this.productLocation,
    required this.distance,
    required this.img,
    required this.onTap,
    required this.belowbtn,
  });
}
