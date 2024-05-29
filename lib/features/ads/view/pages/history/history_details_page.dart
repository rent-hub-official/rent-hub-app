import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/history_constants/purchase_history.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/history_widgets/list_of_booking_history_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/history_widgets/list_of_purchase_history_widget.dart';

class HistoryDetailsPage extends HookConsumerWidget {
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

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: context.spaces.space_150),
          child: RoundedIconButton(
              onTap: () {
                // TODO navigate previos page
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
                child: Text("purchaseConsts.txtBookingHistory,"
                    // style: selectedTabIndex.value == 0
                    //     ? context.typography.body
                    //     : context.typography.bodyWhite,
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
            // TODO change Sample model
            ListOfPurchaseHistoryWidget(
              productModelSample: [
                ProductModelSample(
                    isCompleted: false,
                    productName: 'Benz',
                    price: 999,
                    productLocation: 'Kozhikode,Kerala',
                    distance: 10,
                    img:
                        'https://www.topgear.com/sites/default/files/2022/09/1-BMW-3-Series.jpg',
                    onTap: () {},
                    belowbtn: purchaseConsts.txtBtn),
              ],
            ),
            // TODO change Sample model
            ListOfBookingHistoryWidget(
              productModelSample: [
                ProductModelSample(
                    productName: 'Benz',
                    price: 999,
                    productLocation: 'Kozhikode,Kerala',
                    distance: 10,
                    img:
                        'https://www.topgear.com/sites/default/files/2022/09/1-BMW-3-Series.jpg',
                    onTap: () {},
                    belowbtn: purchaseConsts.txtBtn),
              ],
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
