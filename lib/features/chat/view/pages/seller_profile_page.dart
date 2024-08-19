import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/features/ads/view/widgets/product_card_shimmer/product_card_shimmer_widget.dart';
import 'package:rent_hub/core/constants/ads/seller_profile.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/widgets/product_card_widget.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:rent_hub/features/ads/view/pages/product_details_page/product_details_page.dart';
import 'package:rent_hub/features/chat/controller/get_user_details_controller.dart';
import 'package:rent_hub/features/chat/controller/seller_product_controller.dart';
import 'package:rent_hub/features/chat/widgets/seller_details_widget.dart';

class SellerProfilePage extends ConsumerWidget {
  static const routePath = '/sellerprofile';
  const SellerProfilePage({required this.Userdata});
  final AdsModel Userdata;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constans = ref.watch(sellerProfileProvider);

    return Scaffold(
      backgroundColor: context.colors.primary,
      body: ref.watch(GetUserDetailsDataProvider(Userdata.sellerId)).when(
          data: (data) => SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: context.spaces.space_125,
                          left: context.spaces.space_125 * 3,
                          right: context.spaces.space_125),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RoundedIconButton(
                              backgroundColor:
                                  AppColorPalettes.grey100.withOpacity(0.5),
                              onTap: () {
                                context.pop();
                              },
                              icon: Icons.chevron_left),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.more_vert))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(context.spaces.space_200),
                            child: Column(
                              children: [
                                SellerDetailsWidget(
                                  sellerLocation: Userdata.sellerId ?? "",
                                  sellerName: data.data()?.userName ?? "",
                                  userImg: data.data()?.profileImage ?? "",
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(context.spaces.space_200),
                              decoration: BoxDecoration(
                                color: context.colors.cardBackground,
                                borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(context.spaces.space_300),
                                  topRight:
                                      Radius.circular(context.spaces.space_300),
                                ),
                              ),
                              child: ref
                                  .watch(SellerProductProvider(
                                      sellerId: Userdata.sellerId!))
                                  .when(
                                    data: (data) => ListView.builder(
                                      itemCount: data.docs.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: ProductCardWidget(
                                            name: data.docs[index]
                                                .data()
                                                .productName,
                                            price:
                                                data.docs[index].data().price,
                                            location: data.docs[index]
                                                .data()
                                                .locationTitle,
                                            image: data.docs[index]
                                                .data()
                                                .imagePath[0],
                                            onTap: () {
                                              context.push(
                                                ProductDetailsPage.routePath,
                                                extra: data.docs[index],
                                              );
                                            },
                                            actionBtnLabel:
                                                constans.txtContinue,
                                          ),
                                        );
                                      },
                                    ),
                                    error: (error, stackTrace) => Center(
                                      child: Column(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              ref.invalidate(
                                                  sellerProductProvider);
                                            },
                                            icon: Icon(Icons.refresh),
                                          ),
                                          Text(error.toString()),
                                        ],
                                      ),
                                    ),
                                    loading: () => LoadingWidget(),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          error: (error, stackTrace) => Center(
                child: Text(error.toString()),
              ),
          loading: () => LoadingWidget()),
    );
  }
}
