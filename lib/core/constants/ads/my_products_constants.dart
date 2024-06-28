import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_products_constants.g.dart';

class MyProductsConstants {
  final String txtAppBarTitle = 'My Products';
  final String txtViews = 'Views :';
  final String txtLikes = 'Likes :';
  final String txtPerday = '/day';
  final String txtRupay = '₹';
  final String txtDelete = 'Delete';
  final String txtEdit = 'Edit';
  final String txtShare = 'Share';
}

@riverpod
MyProductsConstants myProductsConstants(MyProductsConstantsRef ref) {
  return MyProductsConstants();
}
