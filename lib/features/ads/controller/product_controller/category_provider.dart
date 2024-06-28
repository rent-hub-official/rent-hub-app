import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/ads/domain/usecase/product_use_case/get_category_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_provider.g.dart';

@riverpod
Future<QuerySnapshot<Map<String, dynamic>>> categoryProvider(
        CategoryProviderRef ref) =>
    GetCategoryUseCase()();
