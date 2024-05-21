import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/ordersummery/dateselectWidget.dart';
import 'package:rent_hub/features/ads/view/widgets/ordersummery/locatio_widget.dart';

Future<void> showmodelbottomsheet(
    {required BuildContext context,
    required WidgetRef ref,
    required bool value,
    required pickordropdate,
    required selectpicklocation,
    required location,
    required privacyPolicytext,
    required agreetext,
    required pickupdatetext,
    required dropdatetext,
    required btnTxt,
    required void Function() onTap,
    required String price}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
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
                        color: AppColorPalettes.grey100
                        // color: AppColorPalettes.grey150.withOpacity(0.6),
                        // color: AppColorPalettes.grey150.withOpacity(0.6),
                        ),
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
                                      style:
                                          context.typography.bodyLargeSemiBold,
                                    ),
                                  ),
                                  DateselectWidget(
                                    () {
                                      selectDate(context, ref,
                                          ref.read(pickDateProvider));
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
                                      style:
                                          context.typography.bodyLargeSemiBold,
                                    ),
                                  ),
                                  DateselectWidget(
                                    () {
                                      selectDate(context, ref,
                                          ref.watch(selectedDateProvider));
                                    },
                                    date: pickordropdate,
                                    typography: context.typography,
                                    spacer: context.spaces,
                                    colors: context.colors,
                                    selectedDate:
                                        ref.watch(selectedDateProvider),
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
                            padding: EdgeInsets.only(
                                bottom: context.spaces.space_400),
                            child: Container(
                              width: double.infinity,
                              height: 57,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: context.colors.border,
                                  width: .5,
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
    },
  );
}



Future<void> selectDate(
    BuildContext context, WidgetRef ref, DateTime selectedDate) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );

  if (pickedDate != null && pickedDate != selectedDate) {
    ref.read(selectedDateProvider.notifier).state = pickedDate;
  }
}

final pickDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
final selectedDateProvider = StateProvider<DateTime>((ref) => DateTime.now());
