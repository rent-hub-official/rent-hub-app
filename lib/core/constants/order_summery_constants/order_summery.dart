import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'order_summery.g.dart';

class OrderSummery {
  final String txtPickUpDate = "Pick up date";
  final String txtDropUp = "Drop Up";
  final String txtSelectLocation = "Select pick up location";
  final String txtReturnLocation = "Return to the same location";
  final String txtPolicyTerms =
      "I agree to the RentHub Privacy Policy and Terms";
  final String txtBtn = "Pay";
}

@riverpod
OrderSummery orderSummery(OrderSummeryRef ref) {
  return OrderSummery();
}
