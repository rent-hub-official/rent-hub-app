import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/chat/domain/usecase/get_user_use_case/get_user_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_user_conroller.g.dart';

@riverpod
Stream<QuerySnapshot<AccountDetailsModel>> getAllUser(GetAllUserRef ref) {
  return GetUserUseCase()();
}
