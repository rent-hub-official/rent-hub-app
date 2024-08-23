import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:rent_hub/features/ads/service/ads_with_id_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_ads_provider.g.dart';

@riverpod
Future<AdsModel?> fetchAdsWithId(FetchAdsWithIdRef ref,
    {required String id}) async {
  final data = await AdsWithIdService()(id: id);

  return data.data();
}
