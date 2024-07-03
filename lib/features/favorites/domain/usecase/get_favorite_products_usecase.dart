import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/favorites/service/favorite_ads_service.dart';

///usecase calls getFavorite method from service layer
class GetFavoriteProductsUsecase {
  Future<QuerySnapshot<Map<String, dynamic>>> call({required String userId}) {
    return FavoriteAdsService.getFavoriteAds(userId: userId);
  }
}
