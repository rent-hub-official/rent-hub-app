import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/features/authentication/controller/authenticcation_provider/authentication_state.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/authentication_use_cases/log_out_use_case.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/authentication_use_cases/signin_with_otp_credential_usecase.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/authentication_use_cases/verify_phone_number_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_provider.g.dart';

// authentication verification

@Riverpod(keepAlive: true)
class Authentication extends _$Authentication {
  @override
  AuthenticationState build() {
    return const AuthenticationState(
      isLoading: false,
      phoneNumber: null,
      verificationId: null,
    );
  }

  //verify phonenumber
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
  }) async {
    state = state.copyWith(isLoading: true, phoneNumber: phoneNumber);

    await VerifyPhoneNumberUseCase()(
      phoneNumber: phoneNumber,
      codeSent: (verificationId, forceResendingToken) {
        state = state.copyWith(verificationId: verificationId);
      },
    );

    state = state.copyWith(isLoading: false);
  }

  // verify otp and signin with credential
  Future<void> verifyOtp({required String smsCode}) async {
    state = state.copyWith(isLoading: true);

    await SigninWithOtpCredentialUseCase()(
        smsCode: smsCode, verificationId: state.verificationId);

    state = state.copyWith(isLoading: false);
  }

  // logout
  Future<void> logout() async {
    state = state.copyWith(isLoading: true);

    await LogOutUseCase()();

    state = state.copyWith(isLoading: true);
  }

 
}

// country code provider
final coutryCodeProvider = StateProvider<String>(
  (ref) => '+91',
);
