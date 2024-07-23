

import 'package:rent_hub/features/payment/domain/model/bank_account_details_model.dart';
import 'package:rent_hub/features/payment/domain/use_case/get_bank_account_details_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'get_bank_account_details_controller.g.dart';

@riverpod
Future<BankAccountDetailsModel?> getBankAccount(GetBankAccountRef ref, {required String id} ) async{
  return await GetBankAccountDetailsUseCase()(id: id);

}