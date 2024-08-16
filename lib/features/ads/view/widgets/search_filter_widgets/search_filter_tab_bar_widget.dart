import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/ads/filter_sort.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

class SearchFilterTabBarWidget extends ConsumerWidget {
  const SearchFilterTabBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterConsts = ref.read(filterSortConstantsProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.spaces.space_200),
      child: TabBar(
        splashFactory: NoSplash.splashFactory,
        dividerHeight: 0,
        indicatorColor: context.colors.primary,
        labelPadding: EdgeInsets.only(right: context.spaces.space_300),
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        labelStyle: context.typography.bodySemibold,
        tabs: [
          for (int i = 0; i < filterConsts.filterOptions.length; i++)
            Tab(text: filterConsts.filterOptions[i]),
        ],
      ),
    );
  }
}
