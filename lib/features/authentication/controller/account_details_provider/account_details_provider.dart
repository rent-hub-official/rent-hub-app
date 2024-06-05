import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_hub/core/exception/base_exception/base_exception.dart';
import 'package:rent_hub/core/utils/snakbar/error_snackbar.dart';
import 'package:rent_hub/features/authentication/controller/account_details_provider/account_details_state.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/account_details_add%20_use_cases.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/delete_image_use_case.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/get_account_details_use_case.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/upload_image_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_details_provider.g.dart';

// image provider
final imageProvider = StateProvider<XFile?>((ref) => null);

// account details controller
@Riverpod(keepAlive: true)
class AccountDetails extends _$AccountDetails {
  @override
  AccountDetailsState build() {
    return const AccountDetailsState(
      imageRef: null,
      isLoading: false,
    );
  }

  // upload image
  Future<void> uploadImage(
    BuildContext context, {
    required File image,
    required String userId,
  }) async {
    try {
      // already image in storage
      if (state.imageRef != null) {
        await DeleteImageUseCase()(userId: userId);
      }
      String imageUrl =
          await UploadImageUseCase()(image: image, userId: userId);

      state = state.copyWith(imageRef: imageUrl);
    } on BaseException catch (e) {
      Future.sync(
        () => ErrorSnackBar(context, errorMessage: e.message),
      );
    }
  }

  // add user data
  Future<void> addData(
    BuildContext context, {
    required String userId,
    required String userName,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      await AccountDeatailsAddUseCase()(
        userId: userId,
        accountDetails: AccountDetailsModel(
          userName: userName,
          profileImage: state.imageRef ?? '',
        ),
      );
    } on BaseException catch (e) {
      state = state.copyWith(isLoading: false);

      Future.sync(
        () => ErrorSnackBar(context, errorMessage: e.message),
      );
    }
    state = state.copyWith(isLoading: false);
  }
}

// get accountDetails provider
@riverpod
Future<DocumentSnapshot<AccountDetailsModel>> getAccountDetails(
    GetAccountDetailsRef ref,
    {required String userId}) {
  return GetAccountDeatailsUseCase()(userId);
}
