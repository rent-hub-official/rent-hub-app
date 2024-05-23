import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'filter_sort.g.dart';

class FilterSort {
  final txtHeading = "Filters & sort";

  final txtEnterLocation = "Enter your location";
  final txtResetAllBtn = "Reset All";
  final txtApplyBtn = "Apply";

  final txtTitle = "Title";

  final txtAscending = "Ascending";
  final txtDescending = "Descending";
  final List<String> filterOptions = [
    "Product Type",
    "Location",
    "Price Range",
    "Sort by",
    "Order"
  ];
  final List<String> productType = [
    "All",
    "House",
    "Vehicle",
    "Cloths",
    "Tools"
  ];
  final List<String> priceRange = [
    "0-999",
    "1000-9999",
    "10000-99999",
    "100000-999999",
    "1000000-9999999"
  ];
  final List<String> sortBy = ["Title", "Date Created", "Date Modified"];
  final List<String> orderedBy = ["Ascending", "Descending"];
}

@riverpod
FilterSort filterSort(FilterSortRef ref) {
  return FilterSort();
}
