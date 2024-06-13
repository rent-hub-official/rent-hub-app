import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({
    super.key,
    required this.tabController,
    required this.categoryList,
  });

// Tab bar controller
  final TabController tabController;
  // list of category
  final List<String> categoryList;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      splashFactory: NoSplash.splashFactory,
      dividerColor: Colors.transparent,
      labelColor: context.colors.primary,
      indicatorColor: Colors.transparent,
      labelPadding: EdgeInsets.only(right: context.spaces.space_200),
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      labelStyle: context.typography.bodySemibold,
      tabs: [
        // list of tabs
        for (int i = 0; i < categoryList.length; i++)
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              // navigate when ontap
              tabController.animateTo(i);
            },
            child: Container(
              margin: EdgeInsets.all(context.spaces.space_100),
              height: context.spaces.space_500,
              decoration: BoxDecoration(
                color: context.colors.cardBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.spaces.space_200),
                  child: Text(
                    categoryList[i],
                    style: context.typography.body,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
