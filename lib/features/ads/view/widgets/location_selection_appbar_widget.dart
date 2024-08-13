import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/ads/controller/location_controller/location_search_provider.dart';
import 'package:rent_hub/features/ads/controller/location_controller/place_lat_long_provider.dart';

AppBar locaSelectionAppBarWidget({
  required BuildContext context,
  required TextEditingController searchController,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Padding(
      padding: EdgeInsets.all(context.spaces.space_50),
      child: RoundedIconButton(
        onTap: () {
          context.pop();
        },
        icon: Icons.chevron_left,
      ),
    ),
    title: Consumer(
      builder: (context, ref, _) => CupertinoSearchTextField(
        controller: searchController,
        backgroundColor: context.colors.cardBackground,
        padding: EdgeInsets.symmetric(
          horizontal: context.spaces.space_150,
          vertical: context.spaces.space_150,
        ),
        prefixIcon: Icon(Icons.search),
        suffixIcon: Icon(Icons.close),
        suffixMode: OverlayVisibilityMode.always,
        onSuffixTap: () {
          searchController.clear();

          ref.invalidate(locationSearchProvider);

          ref.read(locationBtnProvider.notifier).state = false;
        },
        onChanged: (value) {
          if (searchController.text.isNotEmpty)
            ref.read(locationBtnProvider.notifier).state = true;
          else
            ref.read(locationBtnProvider.notifier).state = false;

          ref.read(locationSearchProvider.notifier).search(value);
        },
        onSubmitted: (value) {
          ref.read(locationSearchProvider.notifier).search(value);
        },
      ),
    ),
  );
}
