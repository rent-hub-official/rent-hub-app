import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile.g.dart';

class UserProfile {
  final txtMyAds = "My Ads";
  final txtOrderHistory = "Order History";
  final txtPurchaseHistory = "Purchase History";
  final txtMakeADeal = "Make a Deal";
  final txtAccountSettings = "Account Settings";
  final txtHelpSupport = "Help & support";
  final txtSubHeading = "Help Center and leagal Terms";
}

@riverpod
UserProfile userProfile(UserProfileRef ref) {
  return UserProfile();
}
