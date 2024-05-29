import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_account_constants.g.dart';

class AddBankAccountConstants {
  final String txtCancel = 'Cancel';
  final String txtBankDetails = 'Bank account details';
  final String txtBank = 'Bank';
  final String txtSelect = 'Select Bank';
  final String txtName = 'Name';
  final String txtAcHolder = 'Accounut holder\'s name';
  final String txtIfsc = 'IFSC Code';
  final String txtAcNumber = 'Account Number';
  final String txtConfirm = 'Account Number Confirm';
  final String txtTermsAndConditionsct1 =
      '*By adding this bank account, I agree to ';
  final String txtTermAndConditionSctn2 = ' RentHub T&Cs';
  final String txtTermAndConditionSctn3 =
      'regarding topping up from bank account';
  final String txtAddAc = 'Add Account';
  final String txtCantBeNull = 'Can\'t be null';
}

@riverpod
AddBankAccountConstants addBankAccountConstants(
        AddBankAccountConstantsRef ref) =>
    AddBankAccountConstants();
