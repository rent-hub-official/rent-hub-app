import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:rent_hub/features/ads/service/ads_with_id_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_ads_provider.g.dart';

@riverpod
Future<DocumentSnapshot<AdsModel>> fetchAdsWithId(FetchAdsWithIdRef ref,
    {required String id}) async {
  return await AdsWithIdService()(id: id);
}
