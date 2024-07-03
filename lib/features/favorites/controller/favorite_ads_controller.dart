import 'package:rent_hub/features/ads/domain/model/ads_model.dart';
import 'package:rent_hub/features/favorites/domain/model/favorites_model.dart';
import 'package:rent_hub/features/favorites/domain/usecase/get_favorite_products_usecase.dart';
import 'package:rent_hub/features/favorites/domain/usecase/set_favorite_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_ads_controller.g.dart';

@riverpod
class FavoriteAds extends _$FavoriteAds {
  @override
  bool build() {
    return false;
  }

  Future<void> setFavorite({required FavoritesModel favModel}) async {
    state = true;

    await SetFavoriteUsecase()(model: favModel);

    state = false;
  }

  Future<List<AdsModel>> getFavorite({required String userId}) async {
    state = true;

    final data = await GetFavoriteProductsUsecase()(userId: userId);

    state = false;

    return data;
  }
}
