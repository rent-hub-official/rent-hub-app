import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'offer_page.g.dart';
class OfferPage {
  final String txtHeading = "Make  A Deal";
  final String txtDuration = "Duration";
  final String txtOffers = "Offers";
  final String txtMonthly = "Monthly";
  final String txtAddBtn = "Add";
  final String txtAddMore = "Add More";
}

@riverpod
OfferPage offerPage(OfferPageRef ref) {
  return OfferPage();
}
