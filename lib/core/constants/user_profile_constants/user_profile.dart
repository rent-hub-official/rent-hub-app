import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_profile.g.dart';
class UserProfile {
  final String txtMyAds = "My Ads";
  final String txtOrderHistory = "Order History";
  final String txtPurchaseHistory = "Purchase History";
  final String txtMakeADeal = "Make a Deal";
  final String txtAccountSettings = "Account Settings";
  final String txtHelpSupport = "Help & support";
  final String txtSubHeading ="Help Center and leagal Terms";
}
@riverpod 
UserProfile userProfile(UserProfileRef ref){
  return
  UserProfile();
}