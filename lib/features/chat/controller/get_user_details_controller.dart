import 'package:rent_hub/features/ads/domain/usecase/get_account_details_use_case.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_user_details_controller.g.dart';

@riverpod
Future<AccountDetailsModel> getUserDetailsData(GetUserDetailsDataRef ref,
    {required String userId}) async {
  final userDetails = await GetAccountDetailsUseCase()(userId);
  return userDetails;
}
