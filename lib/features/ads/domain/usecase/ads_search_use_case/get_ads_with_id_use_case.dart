import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/ads_search_use_case/ads_search_use_case.dart';
import 'package:rent_hub/features/ads/service/ads_with_id_service.dart';

class GetAdsWithIdUseCase {
  Future<List<AdsModel>> call(String queryText) async {
    try {
      final adsIds = await AdsSearchUsecase()(queryText: queryText);
      final adsList = <AdsModel>[];
      for (var element in adsIds) {
        final id = await AdsWithIdService()(id: element);
        adsList.add(id.data()!);
      }
      return adsList;
    } catch (e) {
      throw Exception('Cannot get ads. Please try again.');
    }
  }
}
