import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/features/ads/domain/usecase/add_product_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_provider.g.dart';

@riverpod
Future<QuerySnapshot<Map<String, dynamic>>> getCategorys(GetCategorysRef ref) {
  return ProductUsecase.getCategory();
}

final StateProvider<int?> categoryItemSelectedIndexProvider =
    StateProvider<int?>(
  (ref) => null,
);
