import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:rent_hub/features/ads/service/ads_with_id_service.dart';

class fetchAdsUsingIdUseCase {
  Future<DocumentSnapshot<AdsModel>> call({required String id}) async {
    return await AdsWithIdService()(id: id);
  }
}
