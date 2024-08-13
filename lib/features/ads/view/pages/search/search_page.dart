import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/ads/user_search_details.dart';
import 'package:rent_hub/core/constants/error_constants.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/utils/bottom_sheet/bottom_sheet_widget.dart';
import 'package:rent_hub/features/ads/controller/search_controller/recent_search_controller.dart';
import 'package:rent_hub/features/ads/controller/search_controller/search_controller.dart';
import 'package:rent_hub/features/ads/view/widgets/search_field_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/search_filter_widgets/order_sort_bottom_sheet.dart.dart';
import 'package:rent_hub/features/ads/view/widgets/search_widgets/search_list_builder_widget.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});
  static const routePath = '/searchPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = TextEditingController();
    final isSearched = useState(false);
    final searchQuery = useState(''); // Use a state to store the query text

    void performSearch(String query) {
      searchQuery.value = query;
      isSearched.value = true;
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: context.spaces.space_900,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: context.spaces.space_300),
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        title: SearchFieldWidget(
          controller: searchController,
          hintText: ref.watch(userSearchDetailsConstantsProvider).txtSearch,
          onChanged: (value) {},
          onFieldSubmitted: (value) {
            ref
                .read(recentSearchProvider.notifier)
                .add(recentSearch: searchController.text);
            performSearch(searchController.text);
            searchController.clear();
          },
          prefixIcon: Icon(Icons.search),
        ),
        actions: [
          Container(
            width: context.spaces.space_800,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(context.spaces.space_300),
              ),
              border: Border.all(color: AppColorPalettes.grey150),
            ),
            child: IconButton(
              icon: const Icon(Icons.tune),
              onPressed: () {
                bottomSheetWidget(
                  context: context,
                  child: OrderSortBottomSheet(),
                );
              },
            ),
          ),
          SizedBox(width: context.spaces.space_200),
        ],
      ),
      body: !isSearched.value
          ? Padding(
              padding: EdgeInsets.all(context.spaces.space_200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ref
                            .watch(userSearchDetailsConstantsProvider)
                            .txtRecentSearch,
                        style: context.typography.h3SemiBold,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ref.read(recentSearchProvider.notifier).removeAll();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(context.spaces.space_150),
                          ),
                          backgroundColor: AppColorPalettes.grey200,
                        ),
                        child: Text(
                          ref.watch(userSearchDetailsConstantsProvider).txtbtn,
                          style: context.typography.bodySmall,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: context.spaces.space_200),
                  Wrap(
                    spacing: context.spaces.space_150,
                    runSpacing: context.spaces.space_100,
                    children: ref.watch(recentSearchProvider).map((search) {
                      return InkWell(
                        onTap: () {
                          searchController.text = search.recentSearch;
                        },
                        child: Chip(
                          label: Text(search.recentSearch),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(context.spaces.space_150),
                            side: const BorderSide(
                                color: AppColorPalettes.grey200),
                          ),
                          backgroundColor: context.colors.cardBackground,
                          deleteIcon: Icon(
                            Icons.close,
                            size: context.spaces.space_200,
                          ),
                          visualDensity: VisualDensity.comfortable,
                          onDeleted: () {
                            ref
                                .read(recentSearchProvider.notifier)
                                .remove(id: search.id);
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            )
          : ref.watch(searchAdsProvider(queryText: searchQuery.value)).when(
                data: (data) => SearchListBuilderWidget(
                  productsList: data,
                ),
                error: (error, stackTrace) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ref.read(errorConstantsProvider).txtWentWrong,
                          style: context.typography.bodySemibold,
                        ),
                        IconButton(
                          onPressed: () {
                            performSearch(searchQuery.value);
                          },
                          icon: Icon(Icons.refresh),
                        ),
                      ],
                    ),
                  );
                },
                loading: () {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
    );
  }
}
