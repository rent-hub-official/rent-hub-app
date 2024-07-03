import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/favorites/domain/model/favorites_model.dart';
import 'package:rent_hub/features/favorites/domain/usecase/get_favorite_products_usecase.dart';
import 'package:rent_hub/features/favorites/service/favorite_ads_service.dart';

class SetFavoriteUsecase {
  call({required FavoritesModel model}) async {
    final data = await GetFavoriteProductsUsecase()(userId: model.userId);
    QueryDocumentSnapshot<Map<String, dynamic>>? favData = null;

    data.docs.map(
      (product) {
        if (product.data()['adsId'] == model.adsId) favData = product;
      },
    );

    if (favData == null) {
      await FavoriteAdsService.addToFavorite(model: model);
    } else {
      await FavoriteAdsService.removeFromFavorite(favDocId: favData!.id);
    }
  }
}
