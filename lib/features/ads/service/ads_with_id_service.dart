import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';

class AdsWithIdService {
  static final adsDb =
      FirebaseFirestore.instance.collection('ads').withConverter(
            fromFirestore: AdsModel.fromFirestore,
            toFirestore: AdsModel.toFireStore,
          );

  Future<DocumentSnapshot<AdsModel>> call({
    required String id,
  }) async {
    try {
      return await adsDb.doc(id).get();
    } catch (e) {
      throw Exception('Cannot get ads. Please try again.');
    }
  }
}
