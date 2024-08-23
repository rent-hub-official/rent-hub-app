import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/product_use_case/get_products_data_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_catagary_products_provider.g.dart';
part 'fetch_catagary_products_provider.freezed.dart';

@freezed
class FetchProductsProviderState with _$FetchProductsProviderState {
  factory FetchProductsProviderState({
    required List<AdsModel>? products,
    required bool isLoading,
    required bool allPagesFetched,
    required String? error,
  }) = _FetchProductsProviderState;
}

//fetch categorised products
@riverpod
class FetchProducts extends _$FetchProducts {
  FetchProductsProviderState build({String? catagory}) {
    fetchCatagorisedProducts();

    return FetchProductsProviderState(
      products: null,
      isLoading: false,
      allPagesFetched: false,
      error: null,
    );
  }

  Future<void> fetchCatagorisedProducts() async {
    try {
      final products = await GetProductsDataUsecase()(catagory: catagory);
      state = state.copyWith(products: products, isLoading: false);
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> fetchNextPageData() async {
    if (state.isLoading || state.allPagesFetched) return;

    try {
      state = state.copyWith(isLoading: true);

      final newPageProducts = await GetProductsDataUsecase()(
          catagory: catagory, lastItem: state.products!.last);

      if (newPageProducts.isEmpty) {
        state = state.copyWith(allPagesFetched: true, isLoading: false);
      } else {
        state = state.copyWith(
          products: [...state.products!, ...newPageProducts],
          isLoading: false,
        );
      }
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }
}

// Future<List<AdsModel>> fetchCatagorisedProducts(FetchCatagorisedProductsRef ref,
//     {String? catagory}) async {
//   return await GetProductsDataUsecase()(catagory: catagory);
// }
