import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'profile_page_constants.g.dart';

class ProfilePageConstants {
  final txtMyAds = "My Ads";
  final txtOrderHistory = "Order History";
  final txtPurchaseHistory = "Purchase history";
  final txtDeal = "Make a Deal";
  final txtAccountSettings = "Account Settings";
  final txtHelpSupport = "Help & support";
  final txtsubHelp = "help Center and legal Terms";
}

@riverpod
ProfilePageConstants profilePageConstants(ProfilePageConstantsRef ref) {
  return ProfilePageConstants();
}
