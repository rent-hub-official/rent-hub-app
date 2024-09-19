import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:rent_hub/features/favorites/domain/usecase/get_favorite_products_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_favorite_ads_controller.g.dart';

/// fetch all favorite ads of the current user
/// return list of document sanpshot of adsmodel
@riverpod
Future<List<AdsModel>> getFavorite(GetFavoriteRef ref) async {
  return await GetFavoriteProductsUsecase()();
}
