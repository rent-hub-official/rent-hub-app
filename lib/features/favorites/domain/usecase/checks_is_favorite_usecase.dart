import 'package:rent_hub/features/favorites/service/favorite_ads_service.dart';

/// checks ad which is [adId] favorite by the current user
/// returns bool accordingly
class IsFavoriteUseCase {
  Future<bool> call({required String adId}) async {
    final data = await FavoriteAdsService.getFavoriteAds();

    for (final item in data.docs) {
      if (item.data()['adsId'] == adId) {
        return true;
      }
    }
    return false;
  }
}
