import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:rent_hub/core/constants/user_profile_constants/user_search_detailes.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/features/search/view/widgets/custom_searchfield_widget/search_field_widget.dart';

class RecentSearchScreen extends ConsumerWidget {
  // TODO
  final List<String> recentSearches = [
    'Vehicles',
    'Tools',
    'Cloths',
    'Rooms',
    'Watch',
    'Computer',
    'Laptop',
    'Computer'
  ];

  RecentSearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: context.spaces.space_900,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: context.spaces.space_300),
          child: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        ),
        title: const SearchFieldWidget(),
        actions: [
          Container(
            width: context.spaces.space_800,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(context.spaces.space_300)),
                border: Border.all(color: AppColorPalettes.grey150)),
            child: IconButton(
              icon: const Icon(
                Icons.tune,
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(width: context.spaces.space_200),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(context.spaces.space_200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //     ref
                //         .watch(userSearchDetailesConstantsProvider)
                //         .txtRecentSearch,
                //     style: context.typography.h3SemiBold),
                // ElevatedButton(
                //   onPressed: () {},
                //   style: ElevatedButton.styleFrom(
                //       shape: RoundedRectangleBorder(
                //           borderRadius:
                //               BorderRadius.circular(context.spaces.space_150)),
                //       backgroundColor: AppColorPalettes.grey200),
                //   child: Text(
                //     ref.watch(userSearchDetailesConstantsProvider).txtbtn,
                //     style: context.typography.bodySmall,
                //   ),
                // )
              ],
            ),
            SizedBox(height: context.spaces.space_200),
            Wrap(
              spacing: context.spaces.space_150,
              runSpacing: context.spaces.space_100,
              children: recentSearches.map((search) {
                return Chip(
                  label: Text(search),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(context.spaces.space_150),
                      side: const BorderSide(color: AppColorPalettes.grey200)),
                  backgroundColor: context.colors.cardBackground,
                  deleteIcon: Icon(
                    Icons.close,
                    size: context.spaces.space_200,
                  ),
                  visualDensity: VisualDensity.comfortable,
                  onDeleted: () {
                    // TODO
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
