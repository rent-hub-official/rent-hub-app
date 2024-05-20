import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_profile_settings.g.dart';

class UserProfileSettings {
  final txtName = "Name";
  final txtBankAccount = "Bank Account Info";
  final txtChangeNo = "Change Phone Number";
  final txtLOgOut = "Log Out";
  final txtDeleteAccount = "Delete account";
}

@riverpod
UserProfileSettings userProfileSettings(UserProfileSettingsRef ref) {
  return UserProfileSettings();
}
