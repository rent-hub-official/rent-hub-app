import 'package:rent_hub/features/ads/domain/usecase/get_account_details_use_case.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_data_provider.g.dart';

@riverpod
Future<AccountDetailsModel> getUserData(
  GetUserDataRef ref,
  userId,
) async {
  return await GetAccountDetailsUseCase()(userId);
}
