import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/ads/add_product.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/features/ads/domain/model/category/category_model.dart';

class CategoryDropDownWidget extends ConsumerWidget {
  const CategoryDropDownWidget({
    super.key,
    required this.itemSelector,
    required this.categoryList,
  });

  final ValueNotifier<String?> itemSelector;
  final List<CategoryModel> categoryList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ref.watch(addProductConstantsProvider).txtcategory,
          style: context.typography.body,
        ),
        DropdownButton<String>(
          isExpanded: true,
          value: itemSelector.value,
          hint: Text(
            ref.watch(addProductConstantsProvider).txtSelectCategory,
            style: context.typography.body,
          ),
          itemHeight: 60,
          underline: Padding(
            padding: EdgeInsets.only(top: context.spaces.space_400),
            child: Divider(
              height: context.spaces.space_200,
              color: context.colors.border,
            ),
          ),
          items: categoryList
              .map(
                (e) => DropdownMenuItem(
                  value: e.id,
                  child: Text(e.name),
                ),
              )
              .toList(),
          onChanged: (value) {
            itemSelector.value = value;
          },
        ),
      ],
    );
  }
}
