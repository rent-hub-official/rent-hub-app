import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_account_constants.g.dart';

class AddAccountConstants {
  final String textCancel = 'Cancel';
  final String textBankDetails = 'Bank account details';
  final String textBank = 'Bank';
  final String textSelect = 'Select Bank';
  final String textName = 'Name';
  final String textAcHolder = 'Accounut holder\'s name';
  final String textIfsc = 'IFSC Code';
  final String textAcNumber = 'Account Number';
  final String textConfirm = 'Confirm';
}

@riverpod
AddAccountConstants addAccountConstants(AddAccountConstantsRef ref) =>
    AddAccountConstants();
