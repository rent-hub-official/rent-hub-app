import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_sort.g.dart';

class FilterSortConstants {
  final txtHeading = "Filters & sort";

  final txtEnterLocation = "Enter your location";
  final txtResetAllBtn = "Reset All";
  final txtApplyBtn = "Apply";

  final txtTitle = "Title";

  final txtAscending = "Ascending";
  final txtDescending = "Descending";
  final filterOptions = [
    "Product Type",
    "Location",
    "Price Range",
    "Sort by",
    "Order"
  ];
  final productType = ["All", "Houses", "Vehicle", "Cloths", "Tools"];
  final priceRange = [
    "0-999",
    "1000-9999",
    "10000-99999",
    "100000-999999",
    "1000000-9999999"
  ];
  final sortBy = ["Title", "Date Created", "Date Modified"];
  final orderedBy = ["Ascending", "Descending"];
}

@riverpod
FilterSortConstants filterSortConstants(FilterSortConstantsRef ref) {
  return FilterSortConstants();
}
