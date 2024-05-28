import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_products_constants.g.dart';

class MyProductsConstants {
  final String appBarTitle = 'My Products';
  final String txtViews = 'Views :';
  final String txtLikes = 'Likes :';
  final String txtperday = '/day';
  final String rupay = '₹';
  final String txtDelete = 'Delete';
  final String txtEdit = 'Edit';
  final String txtShare = 'Share';
}

@riverpod
MyProductsConstants myProductsConstants(MyProductsConstantsRef ref) {
  return MyProductsConstants();
}
