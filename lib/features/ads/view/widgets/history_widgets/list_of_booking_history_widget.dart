import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/history_constants/purchase_history.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/widgets/product_card_widget.dart';
import 'package:rent_hub/features/ads/view/pages/history/history_details_page.dart';

class ListOfBookingHistoryWidget extends ConsumerWidget {
  const ListOfBookingHistoryWidget(
      {super.key, required this.productModelSample});

  final List<ProductModelSample> productModelSample;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // purchase history constants
    final purchaseConsts = ref.read(purchaseHistoryConstantsProvider);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: productModelSample.length,
      itemBuilder: (context, index) {
        Widget getContainer(bool? isRejected) {
          if (isRejected == null || !isRejected) {
            return SizedBox();
          } else {
            return Positioned(
                top: context.spaces.space_400,
                right: -40,
                child: Transform.rotate(
                  // angle coverted to radius
                  angle: context.spaces.space_600 * (3.14159 / 180),
                  child: Container(
                    width: context.spaces.space_900 * 2,
                    height: context.spaces.space_250,
                    color: isRejected
                        ? AppColorPalettes.green
                        : AppColorPalettes.red500,
                    child: Center(
                      child: Text(
                        isRejected
                            ? purchaseConsts.txtCompleted
                            : purchaseConsts.txtRejected,
                      ),
                    ),
                  ),
                ));
          }
        }

        return Padding(
          padding: EdgeInsets.only(top: context.spaces.space_150),
          child: Stack(
            children: [
              ProductCardWidget(
                  productName: productModelSample[index].productName,
                  price: productModelSample[index].price,
                  productLocation: productModelSample[index].productLocation,
                  distance: productModelSample[index].distance,
                  img: productModelSample[index].img,
                  onTap: productModelSample[index].onTap,
                  belowbtn: productModelSample[index].belowbtn),
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.spaces.space_400,
                      vertical: context.spaces.space_700),
                  child: Container(
                    color: Colors.amber,
                    child: Row(
                      children: [],
                    ),
                  ),
                ),
              ),
              getContainer(productModelSample[index].isCompleted)
            ],
          ),
        );
      },
    );
  }
}
