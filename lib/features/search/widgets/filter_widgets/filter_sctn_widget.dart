import 'package:flutter/material.dart';
import 'package:rent_hub/core/constants/filters_sort_constants/filter_sort.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

// filter section container
Padding filterSctnWidget(
    {required BuildContext context, required Widget child}) {
  return Padding(
    padding: EdgeInsets.only(
        top: context.spaces.space_150, bottom: context.spaces.space_150),
    child: Container(
      padding: EdgeInsets.only(
          top: context.spaces.space_250, left: context.spaces.space_200),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: context.colors.border),
        borderRadius: BorderRadius.circular(context.spaces.space_150),
      ),
      child: child,
    ),
  );
}

// List of tabbar items

TabBar tabBarWidget(BuildContext context, FilterSort filterConsts) {
  return TabBar(
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
  );
}
