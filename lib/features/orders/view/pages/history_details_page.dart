import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/ads/purchase_history.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/widgets/product_card_widget.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/ads/view/pages/product_details_page/product_details_page.dart';
import 'package:rent_hub/features/orders/controller/fetch_ads_provider.dart';
import 'package:rent_hub/features/orders/controller/orders_provider.dart';

class HistoryDetailsPage extends HookConsumerWidget {
  static const routePath = '/historydetailspage';

  HistoryDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // purchase history constants
    final purchaseConsts = ref.read(purchaseHistoryConstantsProvider);

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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.spaces.space_200),
        child: ref.watch(ordersProvider).when(
              data: (data) => data.isEmpty
                  ? Center(
                      child: Text('No Orders'),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return data[index] == null
                            ? Center(child: SizedBox.shrink())
                            : ref
                                .watch(FetchAdsWithIdProvider(
                                    id: data[index]!.adsId))
                                .when(
                                  data: (data) => Padding(
                                    padding: EdgeInsets.only(
                                        top: context.spaces.space_150),
                                    child: Stack(
                                      children: [
                                        ProductCardWidget(
                                          name: data!.productName,
                                          price: data.price,
                                          location: data.locationTitle,
                                          image: data.imagePath[0],
                                          onTap: () {
                                            context.push(
                                                ProductDetailsPage.routePath,
                                                extra: data);
                                          },
                                          actionBtnLabel: 'Reorder',
                                        ),
                                      ],
                                    ),
                                  ),
                                  error: (error, stackTrace) => Center(),
                                  loading: () => Center(),
                                );
                      },
                    ),
              error: (error, stackTrace) => Center(
                child: Text(error.toString()),
              ),
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
            ),
      ),
    );
  }
}

// change sample model class
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
