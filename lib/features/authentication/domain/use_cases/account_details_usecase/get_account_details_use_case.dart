import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/authentication/service/account_details_service.dart';

// get account details
final class GetAccountDeatailsUseCase {
  Future<DocumentSnapshot<AccountDetailsModel>> call(String userId) async {
    try {
      return AccountDetailsService.getData(userId);
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
