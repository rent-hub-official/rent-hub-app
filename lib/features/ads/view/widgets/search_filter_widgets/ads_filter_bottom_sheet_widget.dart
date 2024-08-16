import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/ads/filter_sort.dart';
import 'package:rent_hub/core/enums/search_filter/price_range_enum.dart';
import 'package:rent_hub/core/enums/search_filter/sort_by_enum.dart';
import 'package:rent_hub/core/enums/search_filter/sort_type_enum.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/features/ads/controller/search_controller/filter_controller.dart';
import 'package:rent_hub/features/ads/view/widgets/search_filter_widgets/check_box_filter_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/search_filter_widgets/choose_location_field_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/search_filter_widgets/filter_sctn_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/search_filter_widgets/radio_button_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/search_filter_widgets/search_filter_tab_bar_widget.dart';

class AdsFilterBottomSheetWidget extends HookConsumerWidget {
  const AdsFilterBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // filter constants
    final filterConsts = ref.read(filterSortConstantsProvider);

    // text editing controller
    final locationController = useTextEditingController();

    /// Filter options currently selected by the user
    final filterOptions = ref.watch(filterControllerProvider);

    final productTypes = useState<List<bool>>(
      [for (int i = 0; i < filterConsts.productType.length; i++) false],
    );

    return DefaultTabController(
      length: 5,
      child: SizedBox(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.6,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: context.spaces.space_200),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: context.spaces.space_100),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.spaces.space_200),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        filterConsts.txtHeading,
                        style: context.typography.h3SemiBold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ref.invalidate(filterControllerProvider);
                        locationController.clear();
                        productTypes.value = [
                          for (int i = 0;
                              i < filterConsts.productType.length;
                              i++)
                            false
                        ];
                      },
                      child: Text(
                        filterConsts.txtResetAllBtn,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.spaces.space_100),

              /// Tabs for the filter
              const SearchFilterTabBarWidget(),
              Expanded(
                child: TabBarView(
                  children: [
                    FilterSctnWidget(
                      child: ListView.separated(
                        itemCount: filterConsts.productType.length,
                        separatorBuilder: (context, index) => SizedBox(
                          height: context.spaces.space_150,
                        ),
                        itemBuilder: (context, index) => CheckBoxFilterWidget(
                          text: filterConsts.productType[index],
                          onChanged: (status) {
                            productTypes.value[index] = status!;
                            status
                                ? ref
                                    .watch(filterControllerProvider.notifier)
                                    .addProductTypeFilter(
                                      filterConsts.productType[index],
                                    )
                                : ref
                                    .watch(filterControllerProvider.notifier)
                                    .removeProductTypeFilter(
                                      filterConsts.productType[index],
                                    );
                          },
                          value: productTypes.value[index],
                        ),
                      ),
                    ),
                    // location based filter
                    FilterSctnWidget(
                      child: ChooseLocationFieldWidget(
                        controller: locationController,
                        hintText: filterConsts.txtEnterLocation,
                        onChanged: (value) {
                          value.isNotEmpty
                              ? ref
                                  .watch(filterControllerProvider.notifier)
                                  .addLocationFilter(value)
                              : ref
                                  .watch(filterControllerProvider.notifier)
                                  .removeLocationFilter();
                        },
                      ),
                    ),
                    // filter with price range
                    FilterSctnWidget(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int i = 0;
                              i < filterConsts.priceRange.length;
                              i++)
                            Padding(
                              padding: EdgeInsets.all(context.spaces.space_75),
                              child: RadioButtonWidget<PriceRangeEnum>(
                                label: filterConsts.priceRange[i],
                                groupValue: filterOptions.priceRange,
                                onChanged: (value) {
                                  value != PriceRangeEnum.none
                                      ? ref
                                          .watch(
                                              filterControllerProvider.notifier)
                                          .setPriceRangeFilter(value!)
                                      : ref
                                          .watch(
                                              filterControllerProvider.notifier)
                                          .removePriceRangeFilter();
                                },
                                value: PriceRangeEnum.values[i],
                              ),
                            ),
                        ],
                      ),
                    ),
                    // sorting
                    FilterSctnWidget(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int i = 0; i < filterConsts.sortBy.length; i++)
                            Padding(
                              padding: EdgeInsets.all(context.spaces.space_75),
                              child: RadioButtonWidget<SortByEnum>(
                                label: filterConsts.sortBy[i],
                                groupValue: filterOptions.sortBy,
                                onChanged: (value) {
                                  value != SortByEnum.title
                                      ? ref
                                          .watch(
                                              filterControllerProvider.notifier)
                                          .addSortByFilter(value!)
                                      : ref
                                          .watch(
                                              filterControllerProvider.notifier)
                                          .removeSortByFilter();
                                },
                                value: SortByEnum.values[i],
                              ),
                            ),
                        ],
                      ),
                    ),
                    // choose order
                    FilterSctnWidget(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int i = 0;
                              i < filterConsts.orderedBy.length;
                              i++)
                            Padding(
                              padding: EdgeInsets.all(context.spaces.space_75),
                              child: RadioButtonWidget<SortTypeEnum>(
                                label: filterConsts.orderedBy[i],
                                groupValue: filterOptions.sortOrder,
                                onChanged: (value) {
                                  ref
                                      .watch(filterControllerProvider.notifier)
                                      .addSortOrderFilter(
                                        value ?? SortTypeEnum.ascending,
                                      );
                                },
                                value: SortTypeEnum.values[i],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// Bottom section buttons for the filters
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.spaces.space_200),
                child: PrimaryBtnWidget(
                  onTap: () {
                    // close the bottom sheet
                    Navigator.of(context).pop();
                  },
                  label: filterConsts.txtApplyBtn,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}