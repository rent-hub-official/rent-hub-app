import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'filter_sort.g.dart';
class FilterSort {
  final String txtHeading = "Filters & sort";
  final String txtProductType = "Product Type";
  final String txtLocation = "Location";
  final String txtPriceRange = "Price Range";
  final String txtSortBy = "Sort by";
  final String txtOrder = "Order";
  final String txtAll = "All";
  final String txtHouse = "House";
  final String txtVehicle = "Vehicle";
  final String txtCloths = "Cloths";
  final String txtTools = "Tools";
  final String txtEnterLocation = "Enter your location";
  final String txtResetAllBtn = "Reset All";
  final String txtApplyBtn = "Apply";
  final String txtPriceRange1 = "0-999";
  final String txtPriceRange2 = "1000-9999";
  final String txtPriceRange3 = "10000-99999";
  final String txtPriceRange4 = "100000-999999";
  final String txtPriceRange5 = "1000000-9999999";
  final String txtTitle = "Title";
  final String txtDateCreated = "Date Created";
  final String txtDateModified = "Date Modified";
  final String txtAscending = "Ascending";
  final String txtDescending = "Descending";
}

@riverpod
FilterSort filterSort(FilterSortRef ref) {
  return FilterSort();
}
