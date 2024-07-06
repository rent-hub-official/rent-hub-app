import 'package:rent_hub/features/favorites/domain/usecase/checks_is_favorite_usecase.dart';
import 'package:rent_hub/features/favorites/domain/usecase/set_favorite_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_ads_controller.g.dart';

@riverpod
class FavoriteAds extends _$FavoriteAds {
  @override
  void build() {}

  Future<void> setFavorite({required String adId}) async {
    await SetFavoriteUsecase()(adId: adId);
  }

  Future<bool> isFav(String adId) async {
    return IsFavoriteUseCase()(adId: adId);
  }
}
