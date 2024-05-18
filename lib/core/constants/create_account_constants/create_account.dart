import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'create_account.g.dart';

class CreateAccount {
  final  txtHeading = "Create account";
  final  txtLabelName = "Enter Your Name";
  final  txtHintName = "e.g:Abhi ";
  final  txtSubtitle = "This name will be visible to all other users";
  final  txtbtn = "CREATE";
}

@riverpod
CreateAccount createAccount(CreateAccountRef ref) {
  return CreateAccount();
}
