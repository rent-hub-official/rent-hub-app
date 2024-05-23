import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/exception/base_exception/base_exception.dart';
import 'package:rent_hub/core/utils/snakbar/error_snackbar.dart';
import 'package:rent_hub/features/authentication/controller/authentication_state.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/authentication_use_cases.dart';
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

  // phone number verification
  Future<void> verifyPhoneNuber(BuildContext context,
      {required String phoneNumber}) async {
    state = state.copyWith(isLoading: true, phoneNumber: phoneNumber);

    try {
      await AuthenticationUseCases.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        codeSent: (verificationId, forceResendingToken) {
          state = state.copyWith(verificationId: verificationId);
        },
      );

      // navigate otp page
      Future.sync(() {
        // TODO: complete  @Diviyesh
      });
    } on BaseException catch (e) {
      Future.sync(
        () => ErrorSnackBar(context, errorMessage: e.message),
      );
    }
    state = state.copyWith(isLoading: false);
  }

  // otp verification
  Future<void> otpVerification(
    BuildContext context, {
    required String smsCode,
  }) async {
    try {
      state = state.copyWith(isLoading: true);
      if (state.verificationId != null) {
        final userCredential =
            await AuthenticationUseCases.signinWithOtpCredential(
          verificationId: state.verificationId!,
          smsCode: smsCode,
        );

        // if user is logged push home page
        if (userCredential.user != null) {
          log(userCredential.user!.toString());
          Future.sync(() {
            // TODO: complete  @Diviyesh
            //? navigate home page
          });
        } else {
          Future.sync(
            () => ErrorSnackBar(
              context,
              errorMessage: 'otp verification faild retry',
            ),
          );
        }
      } else {
        // if is verification id faild
        Future.sync(
          () => ErrorSnackBar(
            context,
            errorMessage: 'A error occured phone number verification, retry',
          ),
        );
      }
    } on BaseException catch (e) {
      state = state.copyWith(isLoading: false);

      Future.sync(
        () => ErrorSnackBar(context, errorMessage: e.message),
      );
    }
    state = state.copyWith(isLoading: false);
  }

  // logout
  Future<void> logoutUser(BuildContext context) async {
    state = state.copyWith(isLoading: true);

    try {
      await AuthenticationUseCases.logOut();
    } on BaseException catch (e) {
      state = state.copyWith(isLoading: false);

      Future.sync(
        () => ErrorSnackBar(context, errorMessage: e.message),
      );
    }

    state = state.copyWith(isLoading: false);
  }
}

// auth state changes stream provider
@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return AuthenticationUseCases.authStateChanges();
}

// country code provider
final coutryCodeProvider = StateProvider<String>(
  (ref) => '+91',
);
