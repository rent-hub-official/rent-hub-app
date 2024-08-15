import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/ads/user_search_details.dart';
import 'package:rent_hub/core/constants/error_constants.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/utils/bottom_sheet_utils.dart';
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
    final searchController = useTextEditingController();
    final isSearched = useState(false);

    /// The key use to identify the search field in the app bar.
    final GlobalKey searchFieldKey = useMemoized(() => GlobalKey());

    void performSearch() {
      isSearched.value = false;
      isSearched.value = true;
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: context.spaces.space_900,
        title: SearchFieldWidget(
          key: searchFieldKey,
          controller: searchController,
          hintText: ref.watch(userSearchDetailsConstantsProvider).txtSearch,
          onChanged: (value) {},
          onFieldSubmitted: (value) {
            ref
                .read(recentSearchProvider.notifier)
                .add(recentSearch: searchController.text);

            performSearch();
          },
          prefixIcon: Icon(Icons.search),
        ),
        actions: [
          InkWell(
            onTap: () {
              BottomSheetUtils.show(OrderSortBottomSheet());
            },
            borderRadius: BorderRadius.circular(context.spaces.space_300),
            child: HookBuilder(builder: (context) {
              final heightOfSearchField = useState<double>(0);

              useEffect(() {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  heightOfSearchField.value =
                      searchFieldKey.currentContext!.size!.height;
                });
                return null;
              });

              return Container(
                height: heightOfSearchField.value,
                width: context.spaces.space_800,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(context.spaces.space_300),
                  border: Border.all(color: context.colors.border),
                ),
                child: const Icon(Icons.tune),
              );
            }),
          ),
          SizedBox(width: context.spaces.space_200),
        ],
      ),
      body: !isSearched.value
          ? Builder(builder: (context) {
              final recentSearchValues = ref.watch(recentSearchProvider);

              return Padding(
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
                        if (recentSearchValues.isNotEmpty)
                          TextButton(
                            onPressed: () {
                              ref
                                  .read(recentSearchProvider.notifier)
                                  .removeAll();
                            },
                            style: ButtonStyle(
                                overlayColor: WidgetStatePropertyAll(
                                    context.colors.messageBackground)),
                            child: Text(
                                ref
                                    .watch(userSearchDetailsConstantsProvider)
                                    .txtbtn,
                                style: context.typography.body),
                          ),
                      ],
                    ),
                    SizedBox(height: context.spaces.space_200),
                    Wrap(
                      spacing: context.spaces.space_150,
                      runSpacing: context.spaces.space_100,
                      children: recentSearchValues.map((search) {
                        return GestureDetector(
                          onTap: () {
                            searchController.text = search.recentSearch;
                            performSearch();
                          },
                          child: Chip(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            label: Text(search.recentSearch),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  context.spaces.space_150),
                              side: BorderSide(
                                color: context.colors.border,
                              ),
                            ),
                            backgroundColor: context.colors.cardBackground,
                            deleteIcon: Icon(
                              Icons.close,
                              size: context.spaces.space_200,
                            ),
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
              );
            })
          : ref.watch(searchAdsProvider(queryText: searchController.text)).when(
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
                            performSearch();
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
