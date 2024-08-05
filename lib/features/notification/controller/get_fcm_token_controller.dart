import 'dart:developer';

import 'package:rent_hub/features/authentication/controller/authenticcation_provider/authentication_provider.dart';
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
    log('Getting FCM token from controller $fcmToken');
    return fcmToken;
  }
}
