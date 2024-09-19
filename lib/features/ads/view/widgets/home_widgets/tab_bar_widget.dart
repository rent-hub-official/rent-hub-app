import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
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
    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: context.spaces.space_100),
          TabBar(
            physics: ClampingScrollPhysics(),
            controller: tabController,
            splashFactory: NoSplash.splashFactory,
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            dividerColor: Colors.transparent,
            labelColor: context.colors.primary,
            indicatorPadding:
                EdgeInsets.symmetric(horizontal: context.spaces.space_100),
            indicatorColor: context.colors.primary,
            labelPadding:
                EdgeInsets.symmetric(horizontal: context.spaces.space_100),
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            labelStyle: context.typography.bodySemibold,
            tabs: [
              // list of tabs
              for (int i = 0; i < categoryList.length; i++)
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: context.spaces.space_100),
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
            ],
          ),
          SizedBox(width: context.spaces.space_100),
        ],
      ),
    );
  }
}
