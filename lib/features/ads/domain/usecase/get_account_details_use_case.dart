import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/service/user_details_service.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';

final class GetAccountDetailsUseCase {
  Future<AccountDetailsModel> call(String userId) async {
    try {
      final accountDetails = (await UserDetailsService.getData(userId)).data();

      return (AccountDetailsModel(
        profileImage: accountDetails?.profileImage ?? '',
        userId: accountDetails?.userId ?? '',
        userName: accountDetails?.userName ?? '',
        fcmToken: accountDetails?.fcmToken,
        lastSeen: accountDetails?.lastSeen ?? Timestamp.now(),
      ));
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
