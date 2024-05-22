import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/features/ads/controller/order_controller/dateprovider.dart';
import 'package:rent_hub/features/ads/view/widgets/ordersummery/dateselect_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/ordersummery/locatio_widget.dart';

class OrdersummeryBottomSheetWidget extends ConsumerWidget {
  const OrdersummeryBottomSheetWidget({
    super.key,
    required this.price,
    required this.value,
    required this.pickordropdate,
    required this.selectpicklocation,
    required this.location,
    required this.privacyPolicytext,
    required this.agreetext,
    required this.pickupdatetext,
    required this.dropdatetext,
    required this.btnTxt,
    required this.onTap,
  });

  final void Function() onTap;
  final bool value;

  final String pickupdatetext;
  final String btnTxt;
  final String pickordropdate;
  final String selectpicklocation;
  final String location;
  final String privacyPolicytext;
  final String agreetext;
  final String dropdatetext;
  final String price;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(context.spaces.space_300),
            topRight: Radius.circular(context.spaces.space_300),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: context.spaces.space_600,
            bottom: context.spaces.space_500,
            left: context.spaces.space_200,
            right: context.spaces.space_200,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(context.spaces.space_75),
                      color: AppColorPalettes.grey150.withOpacity(0.2)),
                  child: Padding(
                    padding: EdgeInsets.only(top: context.spaces.space_400),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: context.spaces.space_125,
                                      left: context.spaces.space_75),
                                  child: Text(
                                    pickupdatetext,
                                    style: context.typography.bodyLargeSemiBold,
                                  ),
                                ),
                                DateselectWidget(
                                  () {
                                    ref
                                        .watch(dateSelectProvider.notifier)
                                        .showDatePickerDialog(context, ref,
                                            ref.watch(pickDateProvider));
                                  },
                                  typography: context.typography,
                                  spacer: context.spaces,
                                  colors: context.colors,
                                  date: pickordropdate,
                                  selectedDate: ref.read(pickDateProvider),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: context.spaces.space_125,
                                      left: context.spaces.space_75),
                                  child: Text(
                                    dropdatetext,
                                    style: context.typography.bodyLargeSemiBold,
                                  ),
                                ),
                                DateselectWidget(
                                  () {
                                    ref
                                        .watch(dateSelectProvider.notifier)
                                        .showDateDropDialog(context, ref,
                                            ref.watch(pickDateProvider));
                                  },
                                  date: pickordropdate,
                                  typography: context.typography,
                                  spacer: context.spaces,
                                  colors: context.colors,
                                  selectedDate: ref.watch(selectedDateProvider),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: context.spaces.space_400,
                            left: context.spaces.space_125,
                          ),
                          child: Text(selectpicklocation,
                              style: context.typography.bodyLargeSemiBold),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: context.spaces.space_400),
                          child: Container(
                            width: double.infinity,
                            height: context.spaces.space_700,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: context.colors.border,
                                width: context.spaces.space_25 * 0.25,
                              ),
                              color: AppColorPalettes.white500,
                              borderRadius: BorderRadius.circular(
                                  context.spaces.space_75),
                            ),
                            child: LocationWidget(
                              location: location,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: context.spaces.space_600),
                  child: Row(
                    children: [
                      Checkbox(
                        value: value,
                        onChanged: (val) {},
                      ),
                      Text(agreetext, style: context.typography.bodySmall),
                      InkWell(
                          onTap: () {},
                          child: Text(privacyPolicytext,
                              style: context.typography.bodySmall
                                  .copyWith(color: context.colors.secondary)))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: context.spaces.space_500),
                  child: Text(
                    price,
                    style: context.typography.h1,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      top: context.spaces.space_200,
                    ),
                    child: MainBtnWidget(onTap: onTap, btnTxt: btnTxt))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
