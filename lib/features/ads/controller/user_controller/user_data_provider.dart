import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/ads/domain/model/account_details_model/account_details_model.dart';
import 'package:rent_hub/features/ads/domain/usecase/get_account_details_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_data_provider.g.dart';

@riverpod
Future<DocumentSnapshot<AccountDetailsModel>> getUserData(
    GetUserDataRef ref, userId) {
  return GetAccountDetailsUseCase()(userId);
}
