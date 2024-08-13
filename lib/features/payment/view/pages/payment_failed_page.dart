import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/payment/payment_failed.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/features/payment/view/widgets/payment/payment_info_widget.dart';
import 'package:rent_hub/features/payment/view/widgets/payment/payment_failed_icon.dart';

class PaymentFailedPage extends ConsumerWidget {
  static const routePath = '/paymentfaild';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constant = ref.watch(paymentFailedProvider);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(
            context.spaces.space_200), // Padding for the entire body
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(constant.txtHeading,
                style: context.typography.h1Bold), // Title for payment failed
            Text(
              constant.txtSubHeading, // Message for payment failure
              style: context.typography.h3,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: context
                      .spaces.space_300), // Padding for payment failed icon
              child: PaymentFailedIcon(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: context.spaces
                      .space_300), // Padding for the strike-through amount
              child: Text('', //price
                  style: context.typography.h1Bold.copyWith(
                    decoration:
                        TextDecoration.lineThrough, // Adding strike-through
                    decorationThickness: context
                        .spaces.space_25, // Thickness of the strike-through
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cancel, // Cancel icon
                  color: AppColorPalettes.red500, // Color of the cancel icon
                  size: context.spaces.space_400,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Column(
                    children: [
                      Text(
                          'Failed to pay ${""}', // Text indicating failed to pay someone add {}inside name
                          style: context.typography.h2SemiBold),
                      Text('', // Date and time of payment failure
                          style: context.typography.h3),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: context.spaces
                      .space_300), // Padding for the payment information container
              child: Container(
                padding: EdgeInsets.all(
                  context.spaces
                      .space_200, // Padding for the payment information inside the container
                ),
                decoration: BoxDecoration(
                    color: AppColorPalettes.grey150
                        .withOpacity(0.2), // Background color of the container
                    borderRadius: BorderRadius.circular(
                      context
                          .spaces.space_100, // Border radius of the container
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    PaymentInfoWidget(
                      label: constant.txtReferenceId,
                      value: '', // Payment reference ID (currently empty)
                    ),
                    PaymentInfoWidget(
                      label: constant.txtPaymentMethod,
                      value: '', // Payment method
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top:
                      context.spaces.space_800), // Padding for the retry button
              child: MainBtnWidget(
                  onTap: () {}, btnTxt: constant.txtRetry), // Retry button
            )
          ],
        ),
      ),
    );
  }
}
