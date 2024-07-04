import 'package:rent_hub/features/ads/domain/model/ads_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/search_filter_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_controller.g.dart';

@riverpod
Stream<List<AdsModel>> searchProduct(
  SearchProductRef ref, {
  required String queryText,
  String? order,
  bool? descending,
  double? isGreaterThanOrEqualTo,
  double? isLessThanOrEqualTo,
  Iterable<Object?>? searchCategories,
}) {
  return SearchFilterUsecase()(
    queryText: queryText,
    descending: descending ?? false,
    order: order ?? 'productName',
    isGreaterThanOrEqualTo: isGreaterThanOrEqualTo ?? 0,
    isLessThanOrEqualTo: isLessThanOrEqualTo ?? 9999999,
    searchCategories: searchCategories,
  );
}
