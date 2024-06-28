import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_account_constants.g.dart';

class AddBankAccountConstants {
  final txtCancel = 'Cancel';
  final txtBankDetails = 'Bank account details';
  final txtBank = 'Bank';
  final txtSelect = 'Select Bank';
  final txtName = 'Name';
  final txtAcHolder = 'Accounut holder\'s name';
  final txtIfsc = 'IFSC Code';
  final txtAcNumber = 'Account Number';
  final txtConfirm = 'Account Number Confirm';
  final txtTermsAndConditionsct1 = '*By adding this bank account, I agree to ';
  final txtTermAndConditionSctn2 = ' RentHub T&Cs';
  final txtTermAndConditionSctn3 = 'regarding topping up from bank account';
  final txtAddAc = 'Add Account';
  final txtCantBeNull = 'Can\'t be null';
}

@riverpod
AddBankAccountConstants addBankAccountConstants(
        AddBankAccountConstantsRef ref) =>
    AddBankAccountConstants();
