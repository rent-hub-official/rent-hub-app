import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/storage_exception/storage_exception.dart';
import 'package:rent_hub/features/ads/service/add_ads_service.dart';

// get category

class GetCategoryUseCase {
   Future<QuerySnapshot<Map<String, dynamic>>> call() async {
    try {
      return await AdsService.categoryDb.orderBy('name').get();
    } on FirebaseException catch (e) {
      throw StorageException(error: e.message);
    }
  }
}
