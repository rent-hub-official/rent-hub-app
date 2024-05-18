import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'offer_page.g.dart';
class OfferPage {
  final  txtHeading = "Make  A Deal";
  final  txtDuration = "Duration";
  final  txtOffers = "Offers";
  final  txtMonthly = "Monthly";
  final  txtAddBtn = "Add";
  final  txtAddMore = "Add More";
}

@riverpod
OfferPage offerPage(OfferPageRef ref) {
  return OfferPage();
}
