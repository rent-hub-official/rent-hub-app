import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_profile_settings.g.dart';
class UserProfileSettings {
  final String txtName = "Name";
  final String txtBankAccount = "Bank Account Info";
  final String txtChangeNo = "Change Phone Number";
  final String txtLOgOut = "Log Out";
  final String txtDeleteAccount = "Delete account";
}

@riverpod
UserProfileSettings userProfileSettings(UserProfileSettingsRef ref) {
  return UserProfileSettings();
}
