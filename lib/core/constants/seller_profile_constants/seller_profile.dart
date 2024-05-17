import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'seller_profile.g.dart';
class SellerProfile {
  final String txtReject = "Reject";
  final String txtReason = "Reason ";
  final String txtTyping = "Typing Something";
  final String txtBtn = "Continue";
}

@riverpod
SellerProfile sellerProfile(SellerProfileRef ref) {
  return SellerProfile();
}
