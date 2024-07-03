import 'package:rent_hub/core/utils/snakbar/snackbar_utils.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model.dart';
import 'package:rent_hub/features/favorites/service/favorite_ads_service.dart';
import 'package:rent_hub/features/favorites/service/get_ads_by_id_service.dart';

///usecase calls getFavorite method from service layer
class GetFavoriteProductsUsecase {
  Future<List<AdsModel>> call({required String userId}) async {
    // store all data from favorite collection
    final favAdsDataStream =
        await FavoriteAdsService.getFavoriteAds(userId: userId);

    List<AdsModel> favAdsData = [];
    try {
      /// adsId from fav collection and get adsmodel assign to favAdsData
      ///
      favAdsDataStream.docs.map(
        (favAdDetails) {
          favAdsData.add(GetAdsByIdService.getAdsDetailsWithId(
              id: favAdDetails.data()['adsId']));
        },
      );

      ///returns listof products
      return favAdsData;
    } catch (e) {
      /// shows error snakbar when error occurs
      /// and return empty list
      SnackbarUtils.showError(e.toString());
      return [];
    }
  }
}
