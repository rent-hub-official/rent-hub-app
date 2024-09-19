import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/features/ads/domain/model/category/category_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/product_use_case/get_category_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_provider.g.dart';

@riverpod
Future<List<CategoryModel>> getCategory(GetCategoryRef ref) {
  return GetCategoryUseCase()();
}

final StateProvider<int> categoryItemSelectedIndexProvider = StateProvider<int>(
  (ref) => 0,
);
