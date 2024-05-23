import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class TabbarWidget extends StatelessWidget {
  final Function() onTap;
  final bool isSelected = false;
  final List<String> catogryItems = [
    'All',
    'vehicles',
    'cloths',
    'tools',
    'others'
  ];

  TabbarWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.spaces.space_700,
      width: double.infinity,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) =>
            SizedBox(width: context.spaces.space_25),
        scrollDirection: Axis.horizontal,
        itemCount: catogryItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.all(context.spaces.space_100),
              // width: apptheme.spaces.space_700,
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
                    catogryItems[index],
                    style: context.typography.body,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
