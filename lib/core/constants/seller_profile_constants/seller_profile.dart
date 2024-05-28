import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'seller_profile.g.dart';

class SellerProfile {
  final txtReject = "Reject";
  final txtReason = "Reason ";
  final txtTyping = "Typing Something";
  final txtBtn = "Continue";
  final Btntext = "Rent Now";
}

@riverpod
SellerProfile sellerProfile(SellerProfileRef ref) {
  return SellerProfile();
}
