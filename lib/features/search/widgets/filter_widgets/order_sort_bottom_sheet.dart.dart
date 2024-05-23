import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/filters_sort_constants/filter_sort.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/features/search/widgets/filter_widgets/bottom_sheet_btn_widget.dart';
import 'package:rent_hub/features/search/widgets/filter_widgets/check_box_filter_widget.dart';
import 'package:rent_hub/features/search/widgets/filter_widgets/choose_location_field_widget.dart';
import 'package:rent_hub/features/search/widgets/filter_widgets/filter_sctn_widget.dart';

class OrderSortBottomSheet extends ConsumerWidget {
  const OrderSortBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // filter constants
    final filterConsts = ref.read(filterSortProvider);
    // text editing controller
    final controller = TextEditingController();

    return DefaultTabController(
      length: 5,
      child: SizedBox(
        width: double.infinity,
        height: context.spaces.space_900 * 6,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.spaces.space_200,
            vertical: context.spaces.space_250,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    filterConsts.txtHeading,
                    style: context.typography.h3SemiBold,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      size: context.spaces.space_300,
                    ),
                  ),
                ],
              ),
              TabBar(
                splashFactory: NoSplash.splashFactory,
                dividerHeight: 0,
                labelColor: context.colors.primary,
                indicatorColor: Colors.transparent,
                labelPadding: EdgeInsets.only(right: context.spaces.space_300),
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                labelStyle: context.typography.bodySemibold,
                tabs: [
                  for (int i = 0; i < filterConsts.filterOptions.length; i++)
                    Tab(text: filterConsts.filterOptions[i]),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    filterSctnWidget(
                      context: context,
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          // product type filter
                          children: [
                            for (int i = 0;
                                i < filterConsts.productType.length;
                                i++)
                              checkBoxFilterWidget(
                                context: context,
                                text: filterConsts.productType[i],
                                onChanged: (status) {},
                                value: true,
                              ),
                          ],
                        ),
                      ),
                    ),
                    // location based filter
                    filterSctnWidget(
                      context: context,
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: context.spaces.space_400,
                            top: context.spaces.space_400),
                        child: chooseLocationTextFieldWidget(
                            controller: controller,
                            context: context,
                            hintText: filterConsts.txtEnterLocation),
                      ),
                    ),
                    // filter with price range
                    filterSctnWidget(
                      context: context,
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (int i = 0;
                                i < filterConsts.priceRange.length;
                                i++)
                              checkBoxFilterWidget(
                                  context: context,
                                  text: filterConsts.priceRange[i],
                                  onChanged: (status) {}),
                          ],
                        ),
                      ),
                    ),
                    // sorting
                    filterSctnWidget(
                      context: context,
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (int i = 0; i < filterConsts.sortBy.length; i++)
                              checkBoxFilterWidget(
                                context: context,
                                text: filterConsts.sortBy[i],
                                onChanged: (status) {},
                              ),
                          ],
                        ),
                      ),
                    ),
                    // choose order
                    filterSctnWidget(
                      context: context,
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (int i = 0;
                                i < filterConsts.orderedBy.length;
                                i++)
                              checkBoxFilterWidget(
                                  context: context,
                                  text: filterConsts.orderedBy[i],
                                  onChanged: (status) {}),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  filterBottomSheetBtn(
                    onTap: () {
                      // TODO
                    },
                    color: context.colors.secondary,
                    context: context,
                    text: filterConsts.txtResetAllBtn,
                  ),
                  filterBottomSheetBtn(
                      onTap: () {
                        // TODO
                      },
                      color: context.colors.primary,
                      context: context,
                      text: filterConsts.txtApplyBtn)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
