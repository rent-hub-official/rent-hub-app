import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/account_details_usecase/add_account_details_use_cases.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/account_details_usecase/delete_account_use_case.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/account_details_usecase/get_user_details_usecase.dart';
import 'package:rent_hub/features/authentication/domain/use_cases/account_details_usecase/upload_image_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_details_provider.g.dart';

// account details controller
@riverpod
class AccountDetails extends _$AccountDetails {
  @override
  bool build() {
    return false;
  }

  //add user data
  Future<void> addData({
    required AccountDetailsModel? accountDetails,
    required String userName,
    required XFile? image,
    String? fcmToken,
  }) async {
    state = true;

    if (accountDetails != null && image == null) {
      await AddAccountDeatailsUseCase()(
        accountDetails: accountDetails.copyWith(
          userName: userName,
          fcmToken: fcmToken,
        ),
      );
    } else {
      final imageRef = await UploadImageUseCase()(
        image: File(image?.path ?? ""),
      );

      await AddAccountDeatailsUseCase()(
        accountDetails: AccountDetailsModel(
          userName: userName,
          userId: FirebaseAuth.instance.currentUser!.uid,
          profileImage: imageRef ?? "",
          fcmToken: fcmToken,
        ),
      );
    }

    state = false;
  }

  //delete Account
  Future<void> deleteAccount() async {
    state = true;

    await DeleteAccountUseCase()();

    state = false;
  }
}

@riverpod
Future<DocumentSnapshot<AccountDetailsModel>> getUserDetails(
    GetUserDetailsRef ref) {
  return GetUserDetailsUsecase()();
}
