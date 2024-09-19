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
import 'package:go_router/go_router.dart';

class AdsFilterBottomSheetWidget extends HookConsumerWidget {
  const AdsFilterBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // filter constants
    final filterConsts = ref.read(filterSortConstantsProvider);

    /// Filter options currently selected by the user
    final filterOptions = ref.watch(filterControllerProvider);

    // text editing controller
    final locationController = useTextEditingController();

    /// Store the status of the product category filter check boxes
    final productTypes =
        useState<Set<String>>(filterOptions.productType?.toSet() ?? {});

    /// Currently selected price range filter
    final priceRange = useState<PriceRangeEnum>(filterOptions.priceRange);

    /// Currently selected sort by filter
    final sortBy = useState<SortByEnum>(filterOptions.sortBy);

    /// Currently selected sort order filter
    final sortOrder = useState<SortTypeEnum>(filterOptions.sortOrder);

    /// Reset all the filters
    void resetFilters() {
      ref.invalidate(filterControllerProvider);

      productTypes.value = {};
      priceRange.value = PriceRangeEnum.none;
      sortBy.value = SortByEnum.title;
      sortOrder.value = SortTypeEnum.ascending;
      locationController.clear();
    }

    /// Apply the filters
    void applyFilters() {
      ref.read(filterControllerProvider.notifier).applyFilters(
          priceRange: priceRange.value,
          sortBy: sortBy.value,
          sortOrder: sortOrder.value,
          location: locationController.text,
          productType: productTypes.value.toList());

      context.pop();
    }

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
                      onPressed: resetFilters,
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
                child: HookBuilder(builder: (context) {
                  final filterOptions = filterConsts.productType
                      .where((item) => item.toLowerCase() != "all")
                      .toList();

                  return TabBarView(
                    children: [
                      FilterSctnWidget(
                        child: ListView.separated(
                          itemCount: filterOptions.length,
                          separatorBuilder: (context, index) => SizedBox(
                            height: context.spaces.space_150,
                          ),
                          itemBuilder: (context, index) => CheckBoxFilterWidget(
                            text: filterOptions[index],
                            onChanged: (status) {
                              final updatedCategories = {...productTypes.value};

                              if (status!) {
                                updatedCategories.add(filterOptions[index]);
                              } else {
                                updatedCategories.remove(filterOptions[index]);
                              }

                              productTypes.value = updatedCategories;
                            },
                            value: productTypes.value
                                .contains(filterOptions[index]),
                          ),
                        ),
                      ),

                      /// location based filter
                      FilterSctnWidget(
                        child: ChooseLocationFieldWidget(
                          controller: locationController,
                          hintText: filterConsts.txtEnterLocation,
                        ),
                      ),

                      /// filter with price range
                      FilterSctnWidget(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (int i = 0;
                                i < filterConsts.priceRange.length;
                                i++)
                              Padding(
                                padding:
                                    EdgeInsets.all(context.spaces.space_75),
                                child: RadioButtonWidget<PriceRangeEnum>(
                                  label: filterConsts.priceRange[i],
                                  groupValue: priceRange.value,
                                  onChanged: (value) {
                                    priceRange.value = value!;
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
                                padding:
                                    EdgeInsets.all(context.spaces.space_75),
                                child: RadioButtonWidget<SortByEnum>(
                                  label: filterConsts.sortBy[i],
                                  groupValue: sortBy.value,
                                  onChanged: (value) {
                                    sortBy.value = value!;
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
                                padding:
                                    EdgeInsets.all(context.spaces.space_75),
                                child: RadioButtonWidget<SortTypeEnum>(
                                  label: filterConsts.orderedBy[i],
                                  groupValue: sortOrder.value,
                                  onChanged: (value) {
                                    sortOrder.value = value!;
                                  },
                                  value: SortTypeEnum.values[i],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),

              /// Bottom section buttons for the filters
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.spaces.space_200),
                child: PrimaryBtnWidget(
                  onTap: applyFilters,
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
