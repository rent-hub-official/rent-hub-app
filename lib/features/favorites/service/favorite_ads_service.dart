import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoriteAdsService {
  ///intance for favorite collection
  static final favDb = FirebaseFirestore.instance.collection('favorites');

  ///add adsId and userId in to favorite collection
  ///recieve [FavoritesModel] as argument
  ///document id autogenrated
  ///
  static Future<void> addToFavorite({required String adsId}) async {
    await favDb.doc().set({
      'userId': FirebaseAuth.instance.currentUser!.phoneNumber,
      'adsId': adsId
    });
  }

  ///remove products from favorite
  ///recive [favDocId] which is the id of document tobe deleted
  ///
  static Future<void> removeFromFavorite({required String favDocId}) async {
    await favDb.doc(favDocId).delete();
  }

  ///get favorite products for individual users
  ///recives [userId] as argument
  ///query with userId and returns the result
  ///
  static Future<QuerySnapshot<Map<String, dynamic>>> getFavoriteAds() async {
    return await favDb
        .where('userId',
            isEqualTo: FirebaseAuth.instance.currentUser!.phoneNumber)
        .get();
  }
}
