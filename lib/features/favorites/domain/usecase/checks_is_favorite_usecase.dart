import 'package:rent_hub/features/favorites/domain/model/favorites_model.dart';
import 'package:rent_hub/features/favorites/service/favorite_ads_service.dart';

class IsFavoriteUseCase {
  Future<bool> call({required FavoritesModel model}) async {
    final data = await FavoriteAdsService.getFavoriteAds(userId: model.userId);

    for (final item in data.docs) {
      if (item.data()['adsId'] == model.adsId) {
        return true;
      }
    }
    return false;
  }
}
