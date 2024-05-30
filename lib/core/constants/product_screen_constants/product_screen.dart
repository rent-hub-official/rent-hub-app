import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'product_screen.g.dart';

class ProductScreen {
  final txtPerday = "/day";
  final txtDescription = "Description";
  final txtbtn = "Rent Now";
  final redmoretext = "Red More";
  final redlesstext = "Read more";
}

@riverpod
ProductScreen productScreen(ProductScreenRef ref) {
  return ProductScreen();
}
