import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'filter_sort.g.dart';
class FilterSort {
  final  txtHeading = "Filters & sort";
  final  txtProductType = "Product Type";
  final  txtLocation = "Location";
  final  txtPriceRange = "Price Range";
  final  txtSortBy = "Sort by";
  final  txtOrder = "Order";
  final  txtAll = "All";
  final  txtHouse = "House";
  final  txtVehicle = "Vehicle";
  final  txtCloths = "Cloths";
  final  txtTools = "Tools";
  final  txtEnterLocation = "Enter your location";
  final  txtResetAllBtn = "Reset All";
  final  txtApplyBtn = "Apply";
  final  txtPriceRange1 = "0-999";
  final  txtPriceRange2 = "1000-9999";
  final  txtPriceRange3 = "10000-99999";
  final  txtPriceRange4 = "100000-999999";
  final  txtPriceRange5 = "1000000-9999999";
  final  txtTitle = "Title";
  final  txtDateCreated = "Date Created";
  final  txtDateModified = "Date Modified";
  final  txtAscending = "Ascending";
  final  txtDescending = "Descending";
}

@riverpod
FilterSort filterSort(FilterSortRef ref) {
  return FilterSort();
}
