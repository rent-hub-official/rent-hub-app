import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/authentication/controller/account_details_provider/account_details_state.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/account_details_usecase/add_account_details_use_cases.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/account_details_usecase/get_account_details_use_case.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/account_details_usecase/upload_image_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_details_provider.g.dart';

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
      {required String userId, required File image}) async {
    state = state.copyWith(isLoading: true);

    final ref = await UploadImageUseCase()(image: image, userId: userId);

    state = state.copyWith(imageRef: ref, isLoading: false);
  }

  //add user data
  Future<void> addData({
    required String userId,
    required String userName,
  }) async {
    state = state.copyWith(isLoading: true);

    await AddAccountDeatailsUseCase()(
      userId: userId,
      accountDetails: AccountDetailsModel(
        userName: userName,
        profileImage: state.imageRef ?? "",
      ),
    );

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
