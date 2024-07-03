import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/constants/ads/seller_profile.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/widgets/product_card_widget.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/chat/widgets/seller_details_widget.dart';

class SellerProfilePage extends ConsumerWidget {
  static const routePath = '/sellerprofile';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the seller profile provider to get the constants
    final constans = ref.watch(sellerProfileProvider);

    return Scaffold(
      backgroundColor: context.colors.primary,
      body: SafeArea(
        child: Column(
          children: [
            // Top row with back button and more options button
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
                      onPressed: () {
                      },
                      icon: Icon(Icons.more_vert))
                ],
              ),
            ),
            // Profile Section
            Expanded(
              child: Column(
                children: [
                  // Container to hold the seller details
                  Container(
                    padding: EdgeInsets.all(context.spaces.space_200),
                    child: Column(
                      children: [
                        SellerDetailsWidget(
                          sellerLocation: 'tgdthdfgdh',
                          sellerName: 'ghfchfjhj',
                          userImg: "",
                        ),
                      ],
                    ),
                  ),
                  // Car Rental List
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(context.spaces.space_200),
                      decoration: BoxDecoration(
                        color: context.colors.cardBackground,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(context.spaces.space_300),
                          topRight: Radius.circular(context.spaces.space_300),
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: 6, // Number of items in the list
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: ProductCardWidget(
                              productName: "",
                              price: 0,
                              productLocation: "",
                              distance: 0,
                              img:
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSycvWQYknNQbjyOX5ly3PIMtS6yMXVzku9Q&s",
                              onTap: () {},
                              belowbtn: constans
                                  .txtContinue, // Button text from constants
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
