import 'package:rent_hub/core/exception/base_exception.dart';
import 'package:rent_hub/features/payment/domain/model/bank_account_details_model.dart';
import 'package:rent_hub/features/payment/service/bank_account_details_service.dart';

class GetBankAccountDetailsUseCase {
  Future<BankAccountDetailsModel?> call({required String id}) async {
    try {
      return await BankAccountDetailsService.getBankAccountDetails(id: id);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
