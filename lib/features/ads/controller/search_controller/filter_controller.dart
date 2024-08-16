import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rent_hub/core/enums/search_filter/sort_type_enum.dart';
import 'package:rent_hub/core/enums/search_filter/price_range_enum.dart';
import 'package:rent_hub/core/enums/search_filter/sort_by_enum.dart';
import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_controller.g.dart';
part 'filter_controller.freezed.dart';

@freezed
class FilterControllerState with _$FilterControllerState {
  factory FilterControllerState({
    List<String>? productType,
    String? location,
    required PriceRangeEnum priceRange,
    required SortByEnum sortBy,
    required SortTypeEnum sortOrder,
  }) = _FilterControllerState;
}

@Riverpod(keepAlive: true)
class FilterController extends _$FilterController {
  @override
  FilterControllerState build() {
    return FilterControllerState(
      sortBy: SortByEnum.title,
      priceRange: PriceRangeEnum.none,
      sortOrder: SortTypeEnum.ascending,
    );
  }

  /// Apply the given filters
  void applyFilters({
    List<String>? productType,
    String? location,
    required PriceRangeEnum priceRange,
    required SortByEnum sortBy,
    required SortTypeEnum sortOrder,
  }) {
    if (location != null && location.trim().isEmpty) {
      location = null;
    }

    state = state.copyWith(
      productType: productType,
      location: location,
      priceRange: priceRange,
      sortBy: sortBy,
      sortOrder: sortOrder,
    );
  }

  /// Get the filtered products
  ///
  /// [products] is the products to be filtered
  List<AdsModel> filterAds(List<AdsModel> ads) {
    final List<AdsModel> filteredAds = [];

    for (final ad in ads) {
      bool needToAdd = true;

      /// Check the product type filter
      if ((state.productType?.isNotEmpty ?? false) &&
          !(state.productType?.contains(ad.category) ?? true)) {
        needToAdd = false;
      }

      /// Check the location filter
      if (state.location != null &&
          !ad.locationTitle.contains(state.location!)) {
        needToAdd = false;
      }

      /// Check the price range filter
      if (!(ad.price <= state.priceRange.maxValue &&
          ad.price >= state.priceRange.minValue)) {
        needToAdd = false;
      }

      if (needToAdd) {
        filteredAds.add(ad);
      }
    }

    /// Sort the ads
    filteredAds.sort((a, b) {
      if (state.sortBy == SortByEnum.title &&
          state.sortOrder == SortTypeEnum.ascending) {
        return a.productName.compareTo(b.productName);
      } else if (state.sortBy == SortByEnum.title &&
          state.sortOrder == SortTypeEnum.descending) {
        return b.productName.compareTo(a.productName);
      } else if (state.sortBy == SortByEnum.price &&
          state.sortOrder == SortTypeEnum.ascending) {
        return a.price.compareTo(b.price);
      } else if (state.sortBy == SortByEnum.price &&
          state.sortOrder == SortTypeEnum.descending) {
        return b.price.compareTo(a.price);
      } else if (state.sortBy == SortByEnum.date &&
          state.sortOrder == SortTypeEnum.ascending) {
        return a.dateCreated.compareTo(b.dateCreated);
      } else if (state.sortBy == SortByEnum.date &&
          state.sortOrder == SortTypeEnum.descending) {
        return b.dateCreated.compareTo(a.dateCreated);
      }

      throw Exception('Invalid sort by or sort order');
    });

    return filteredAds;
  }
}
