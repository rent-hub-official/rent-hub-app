import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/filters_sort_constants.dart/filter_sort.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class FilterBottomSheetWidget extends ConsumerWidget {
  const FilterBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterConsts = ref.read(filterSortProvider);
    return DefaultTabController(
      length: 4,
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
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                tabs: [
                  Tab(
                    text: filterConsts.txtProductType,
                  ),
                  Tab(
                    text: filterConsts.txtLocation,
                  ),
                  Tab(
                    text: filterConsts.txtPriceRange,
                  ),
                  Tab(
                    text: filterConsts.txtOrder,
                  ),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text('Tab 1')),
                    Center(child: Text('Tab 2')),
                    Center(child: Text('Tab 3')),
                    Center(child: Text('Tab 4')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
