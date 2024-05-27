import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_account_constants.g.dart';

class AddBankAccountConstants {
  final String textCancel = 'Cancel';
  final String textBankDetails = 'Bank account details';
  final String textBank = 'Bank';
  final String textSelect = 'Select Bank';
  final String textName = 'Name';
  final String textAcHolder = 'Accounut holder\'s name';
  final String textIfsc = 'IFSC Code';
  final String textAcNumber = 'Account Number';
  final String textConfirm = 'Account Number Confirm';
  final String termsAndConditionsct1 =
      '*By adding this bank account, I agree to ';
  final String termAndConditionSctn2 = ' RentHub T&Cs';
  final String termAndConditionSctn3 = 'regarding topping up from bank account';
  final String TextAddAc = 'Add Account';
  final String textCantBeNull = 'Can\'t be null';
}

@riverpod
AddBankAccountConstants addBankAccountConstants(
        AddBankAccountConstantsRef ref) =>
    AddBankAccountConstants();
