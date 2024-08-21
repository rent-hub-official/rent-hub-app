import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/authentication/controller/authenticcation_provider/authentication_provider.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/notification/domain/use_case/get_fcm_token_from_db.dart';
import 'package:rent_hub/features/notification/domain/use_case/get_fcm_token_from_messaging_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_fcm_token_controller.g.dart';

@riverpod
class FcmToken extends _$FcmToken {
  @override
  bool build() {
    return false;
  }

  Future<String?> getFcmTokenFromMessaging() async {
    final fcmToken = await GetFcmTokenFromMessagingUseCase()(
      currentUser: ref.watch(authenticationProvider).phoneNumber,
    );
    return fcmToken;
  }

  Future<DocumentSnapshot<AccountDetailsModel>> getFcmTokenFromDb({
    required String id,
  }) async {
    return await GetFcmTokenFromDb().call(id: id);
  }
}
