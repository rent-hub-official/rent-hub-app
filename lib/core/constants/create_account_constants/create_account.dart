import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'create_account.g.dart';

class CreateAccount {
  final String txtHeading = "Create account";
  final String txtLabelName = "Enter Your Name";
  final String txtHintName = "e.g:Abhi ";
  final String txtSubtitle = "This name will be visible to all other users";
  final String btn = "CREATE";
}

@riverpod
CreateAccount createAccount(CreateAccountRef ref) {
  return CreateAccount();
}
