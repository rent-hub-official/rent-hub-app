import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rent_hub/core/utils/snakbar/snackbar_utils.dart';
import 'package:rent_hub/core/utils/snakbar/toaster_util.dart';
import 'package:rent_hub/features/favorites/service/favorite_ads_service.dart';

/// usecse for checks weather it is favorite or not
/// if ad already favorite remove else add to favorite
///
class SetFavoriteUsecase {
  Future<void> call({required String adId}) async {
    ///fetch all data from favorite collection
    final data = await FavoriteAdsService.getFavoriteAds();
    QueryDocumentSnapshot<Map<String, dynamic>>? favData = null;

    /// loop through all data from favorite DB
    /// checks adsId matchs
    /// if match it's snapshot stores in favData

    for (final product in data.docs) {
      if (product.data()['adsId'] == adId) favData = product;
    }

    if (favData == null) {
      try {
        await FavoriteAdsService.addToFavorite(adsId: adId);
        // show toster snakbar after added to favorite
        ToasterUtil.showMessage(
            message: 'Product added to favorites', icon: Icon(Icons.favorite));
      } catch (e) {
        // show error snakbar when error found
        SnackbarUtils.showError(e.toString());
      }
    } else {
      try {
        // delete from favorite collection with its id
        await FavoriteAdsService.removeFromFavorite(favDocId: favData.id);
        // show toster snakbar after remove from favorite
        ToasterUtil.showMessage(
            message: 'Product removed from favorites',
            icon: Icon(Icons.favorite));
      } catch (e) {
        // show error snakbar when error found
        SnackbarUtils.showError(e.toString());
      }
    }
  }
}
