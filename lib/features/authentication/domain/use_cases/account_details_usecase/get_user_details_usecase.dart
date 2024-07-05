import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/authentication/service/account_details_service.dart';

final class GetUserDetailsUsecase {
  Future<DocumentSnapshot<AccountDetailsModel>> call() async {
    try {
      return AccountDetailsService.getData();
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
