import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_bank_detailes.g.dart';
class UserBankAccount {
  final String txtCancel = "Cancel";
  final String txtHeading = "Bank account details";
  final String txtBank = "Bank";
  final String txtSelectBank = "Select Bank";
  final String txtName = "Name";
  final String txtHolderName = "Accounut holder’s name";
  final String txtIFSCCode = "IFSC Code";
  final String txtAccountNumber = "Account Number";
  final String txtConfirm = "Account Number Confirm";
  final String txtAccountNo = "Account number";
  final String txt =
      "By adding this bank account, I agree to RentHub T&Cs regarding topping up \nfrom bank account";
  final String txtBtn = "ADD ACCOUNT";
}

@riverpod
UserBankAccount userBankAccount(UserBankAccountRef ref) {
  return UserBankAccount();
}
