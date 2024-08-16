import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

// filter section container

class FilterSctnWidget extends StatelessWidget {
  const FilterSctnWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: context.spaces.space_150,
          horizontal: context.spaces.space_200),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: context.spaces.space_200,
            vertical: context.spaces.space_200),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: context.colors.border),
          borderRadius: BorderRadius.circular(context.spaces.space_100),
        ),
        child: child,
      ),
    );
  }
}
