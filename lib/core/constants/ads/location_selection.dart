import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_selection.g.dart';

final class LocationSelectionConstants {
  final txtBtn = "Use Loction";
}

@riverpod
LocationSelectionConstants locationSelectionConstants(
    LocationSelectionConstantsRef ref) {
  return LocationSelectionConstants();
}
