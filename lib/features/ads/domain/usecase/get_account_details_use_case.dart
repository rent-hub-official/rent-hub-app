import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/domain/model/account_details_model/account_details_model.dart';
import 'package:rent_hub/features/ads/service/user_details_service.dart';

final class GetAccountDeatailsUseCase {
  Future<DocumentSnapshot<AccountDetailsModel>> call(String userId) async {
    try {
      return UserDetailsService.getData(userId);
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
