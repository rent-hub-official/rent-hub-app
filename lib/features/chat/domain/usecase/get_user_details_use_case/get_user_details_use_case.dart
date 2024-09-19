import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/ads/service/user_details_service.dart';
import 'package:rent_hub/features/authentication/domain/model/account_details_model.dart';

final class GetAccountDetailsUseCase {
  Future<AccountDetailsModel> call(String userId) async {
    try {
      final user = await UserDetailsService.getData(userId);
      return user.data()!;
    } on BaseException catch (e) {
      throw e.message;
    }
  }
}
