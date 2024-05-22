import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/filters_sort_constants.dart/filter_sort.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/features/search/widgets/filter_widgets/bottom_sheet_btn_widget.dart';
import 'package:rent_hub/features/search/widgets/filter_widgets/check_box_filter_widget.dart';
import 'package:rent_hub/features/search/widgets/filter_widgets/filter_sctn_widget.dart';

class FilterBottomSheetWidget extends ConsumerWidget {
  const FilterBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // filter constants
    final filterConsts = ref.read(filterSortProvider);
    // List of product types
    final List<String> productType = [
      filterConsts.txtAll,
      filterConsts.txtHouse,
      filterConsts.txtVehicle,
      filterConsts.txtCloths,
      filterConsts.txtTools
    ];
    // List of price range
    final List<String> priceRange = [
      filterConsts.txtPriceRange1,
      filterConsts.txtPriceRange2,
      filterConsts.txtPriceRange3,
      filterConsts.txtPriceRange4,
      filterConsts.txtPriceRange5
    ];
    //List of Sortby
    final List<String> sortBy = [
      filterConsts.txtTitle,
      filterConsts.txtDateCreated,
      filterConsts.txtDateModified
    ];
    // List of order
    final List<String> order = [
      filterConsts.txtAscending,
      filterConsts.txtDescending
    ];
    // List of filter options
    final List<String> filterOptions = [
      filterConsts.txtProductType,
      filterConsts.txtLocation,
      filterConsts.txtPriceRange,
      filterConsts.txtSortBy,
      filterConsts.txtOrder
    ];
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
                  IconButton(
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.close,
                      size: context.spaces.space_300,
                    ),
                  ),
                ],
              ),
              TabBar(
                dividerHeight: 0,
                labelColor: context.colors.primary,

                indicatorColor: Colors.transparent, //change

                // labelPadding: EdgeInsets.only(right: context.spaces.space_150),
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                labelStyle: context.typography.bodySemibold,
                tabs: [
                  for (int i = 0; i < filterOptions.length; i++)
                    Tab(
                      text: filterOptions[i],
                    ),
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
                          children: [
                            for (int i = 0; i < productType.length; i++)
                              checkBoxFilterWidget(
                                  context: context,
                                  text: productType[i],
                                  onChanged: (status) {},
                                  value: true),
                          ],
                        ),
                      ),
                    ),
                    filterSctnWidget(context: context, child: Container()),
                    filterSctnWidget(
                      context: context,
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (int i = 0; i < priceRange.length; i++)
                              checkBoxFilterWidget(
                                  context: context,
                                  text: priceRange[i],
                                  onChanged: (status) {}),
                          ],
                        ),
                      ),
                    ),
                    filterSctnWidget(
                      context: context,
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (int i = 0; i < sortBy.length; i++)
                              checkBoxFilterWidget(
                                  context: context,
                                  text: sortBy[i],
                                  onChanged: (status) {}),
                          ],
                        ),
                      ),
                    ),
                    filterSctnWidget(
                      context: context,
                      child: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            for (int i = 0; i < order.length; i++)
                              checkBoxFilterWidget(
                                  context: context,
                                  text: order[i],
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
                    color: context.colors.secondary,
                    context: context,
                    text: filterConsts.txtResetAllBtn,
                  ),
                  filterBottomSheetBtn(
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
