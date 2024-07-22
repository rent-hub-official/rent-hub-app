import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_screen.g.dart';

class HomeScreenConstants {
  final txtsub = "Near from you";
  final txtBtn = "Rent Now";
  final txtSelectLocation = "Select location";
}

@riverpod
HomeScreenConstants homeScreenConstants(HomeScreenConstantsRef ref) {
  return HomeScreenConstants();
}
