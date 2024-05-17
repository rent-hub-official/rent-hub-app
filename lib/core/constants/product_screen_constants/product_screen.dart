import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'product_screen.g.dart';
class ProductScreen {
  final String txtPerday = "/day";
  final String txtDescription = "Description";
  final String btn = "Rent Now";
}

@riverpod
ProductScreen productScreen(ProductScreenRef ref) {
  return ProductScreen();
}
