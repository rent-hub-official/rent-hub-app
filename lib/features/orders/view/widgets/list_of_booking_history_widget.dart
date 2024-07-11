import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/product_card_widget.dart';
import 'package:rent_hub/features/orders/view/pages/history_details_page.dart';
import 'package:rent_hub/features/orders/view/widgets/reject_accept_status_widget.dart';

class ListOfBookingHistoryWidget extends ConsumerWidget {
  const ListOfBookingHistoryWidget(
      {super.key, required this.productModelSample});

// gets sample model class , change model class necessery
  final List<ProductModelSample> productModelSample;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: productModelSample.length,
      itemBuilder: (context, index) {
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
              // choose reject or accept widget
              RejectOrAcceptWidget(
                  isRejected: productModelSample[index].isCompleted)
            ],
          ),
        );
      },
    );
  }
}
