import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/utils/snakbar/snackbar_utils.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';
import 'package:rent_hub/features/ads/service/ads_service.dart';

class SearchFilterUsecase {
  final adsDbref = AdsService.adsDb;

  Stream<List<AdsModel>> call({
    required String queryText,
    String order = 'productName',
    bool descending = false,
    Iterable<Object?>? searchCategories,
    double isLessThanOrEqualTo = 9999999,
    double isGreaterThanOrEqualTo = 0,
  }) async* {
    try {
      final dataStream = adsDbref
          .orderBy(order, descending: descending)
          .startAt([queryText])
          .endAt([queryText + "\uf8ff"])
          .where("productName", isGreaterThanOrEqualTo: queryText)
          .where("productName", isLessThan: queryText + '\uf8ff')
          .snapshots();

      await for (var event in dataStream) {
        var allData = <AdsModel>[];
        for (var model in event.docs) {
          allData.add(model.data());
        }

        yield allData;
      }
    } on FirebaseException catch (e) {
      SnackbarUtils.showError(e.message ?? 'Cannot get ads. Please try again.');
    } catch (e) {
      SnackbarUtils.showError('Cannot get ads. Please try again.');
    }
  }
}

