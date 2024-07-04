import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model.dart';
import 'package:rent_hub/features/favorites/domain/usecase/checks_is_favorite_usecase.dart';
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

  Future<void> setFavorite({required String adId}) async {
    state = true;

    await SetFavoriteUsecase()(adId: adId);

    state = false;
  }

  Future<bool> isFav(String adId) async {
    return IsFavoriteUseCase()(adId: adId);
  }
}
