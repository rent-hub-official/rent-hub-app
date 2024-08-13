import 'package:rent_hub/features/payment/domain/model/bank_account_details_model.dart';
import 'package:rent_hub/features/payment/domain/use_case/bank_account_details_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'bank_account_details_controller.g.dart';

@riverpod
Future<void> addBankAccountDetailsController(
    AddBankAccountDetailsControllerRef ref,
    {required BankAccountDetailsModel bankAccountDetailsModel,
    required String id}) {
  return BankAccountDetailsUseCase()(
      bankAccountDetailsModel: bankAccountDetailsModel, id: id);
}
