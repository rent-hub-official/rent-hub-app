import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/ads_search_use_case/get_ads_with_id_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_controller.g.dart';

@riverpod
Future<List<DocumentSnapshot<AdsModel>>> searchAds(
  SearchAdsRef ref, {
  required String queryText,
}) async {
  return await GetAdsWithIdUseCase()(queryText);
}
