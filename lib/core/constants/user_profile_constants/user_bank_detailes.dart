import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_bank_detailes.g.dart';

class UserBankAccount {
  final txtCancel = "Cancel";
  final txtHeading = "Bank account details";
  final txtBank = "Bank";
  final txtSelectBank = "Select Bank";
  final txtName = "Name";
  final txtHolderName = "Accounut holder’s name";
  final txtIFSCCode = "IFSC Code";
  final txtAccountNumber = "Account Number";
  final txtConfirm = "Account Number Confirm";
  final txtAccountNo = "Account number";
  final txt =
      "By adding this bank account, I agree to RentHub T&Cs regarding topping up \nfrom bank account";
  final txtBtn = "ADD ACCOUNT";
}

@riverpod
UserBankAccount userBankAccount(UserBankAccountRef ref) {
  return UserBankAccount();
}
