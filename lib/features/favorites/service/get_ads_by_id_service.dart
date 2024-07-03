import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model.dart';

class GetAdsByIdService {
  // ads firestore instance
  static final adsDb =
      FirebaseFirestore.instance.collection('ads').withConverter(
            fromFirestore: AdsModel.fromFirestore,
            toFirestore: AdsModel.toFireStore,
          );

  static getAdsDetailsWithId({required String id}) async {
    return await adsDb.doc(id).get();
  }
}
