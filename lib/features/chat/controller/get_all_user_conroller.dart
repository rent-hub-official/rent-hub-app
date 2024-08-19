import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:rent_hub/features/chat/domain/usecase/get_user_use_case/get_user_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_all_user_conroller.g.dart';

@riverpod
Future<List<AccountDetailsModel>> getAllUser(GetAllUserRef ref) {
  return GetUserUseCase()();
}
