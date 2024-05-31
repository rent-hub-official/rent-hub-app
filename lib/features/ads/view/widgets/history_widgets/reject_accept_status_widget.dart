import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/history_constants/order_history.dart';
import 'package:rent_hub/core/constants/history_constants/purchase_history.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';

class RejectOrAcceptWidget extends ConsumerWidget {
  const RejectOrAcceptWidget({super.key, this.isRejected});
  final bool? isRejected;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // purchase history constants
    final purchaseConsts = ref.read(purchaseHistoryConstantsProvider);
    final orderConsts = ref.read(orderHistoryConstantsProvider);

    /// checks is rejected or pending or action required
    return isRejected == null
        // shows for the owner accept or reject
        ? Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.spaces.space_400,
                  vertical: context.spaces.space_900),
              child: Container(
                decoration: BoxDecoration(
                    color: context.colors.primary,
                    borderRadius:
                        BorderRadius.circular(context.spaces.space_150)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      orderConsts.txtAccept,
                      style: context.typography.bodySemibold,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.spaces.space_600),
                      child: VerticalDivider(),
                    ),
                    Text(
                      orderConsts.txtReject,
                      style: context.typography.bodySemibold,
                    )
                  ],
                ),
              ),
            ),
          )
        // shows label rejected or accepted
        : Positioned(
            top: context.spaces.space_400,
            right: -40,
            child: Transform.rotate(
              // angle coverted to radius
              angle: context.spaces.space_600 * (3.14159 / 180),
              child: Container(
                width: context.spaces.space_900 * 2,
                height: context.spaces.space_250,
                color: isRejected!
                    ? AppColorPalettes.green
                    : AppColorPalettes.red500,
                child: Center(
                  child: Text(
                    isRejected!
                        ? purchaseConsts.txtCompleted
                        : purchaseConsts.txtRejected,
                  ),
                ),
              ),
            ),
          );
  }
}
