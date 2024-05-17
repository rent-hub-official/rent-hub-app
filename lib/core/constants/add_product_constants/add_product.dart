import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'add_product.g.dart';

class AddProduct {
  final String txtHeading = "ADD PRODUCT";
  final String txtPhotos = "Photos";
  final String txtSubHeading =
      "Include 3 to 8 photos for a full product representation";
  final String txtProductName = "Product name";
  final String txtGiveItemName = "Give item name";
  final String txtPrice = "price (per day)";
  final String txtItemPrice = "price of the item";
  final String txtcategory = "category";
  final String txtSelectCategory = "Select category";
  final String txtLocation = "Location";
  final String txtOffers = "Offers";
  final String txtPicOffer = "Pick your offer";
  final String txtDescription = "Description";
  final String txtDescriptionProduct =
      "Give a brief description for your product ";
  final String txtBtn = "POST NOW";
}

@riverpod
AddProduct addProduct(AddProductRef ref) {
  return 
  AddProduct();
}
