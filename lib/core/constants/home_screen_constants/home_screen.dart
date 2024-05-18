import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_screen.g.dart';

class HomeScreen {
  final txtsub = "Near from you";
  final txtBtn = "Rent Now";
}


@riverpod
HomeScreen homeScreen(HomeScreenRef ref) {
  return HomeScreen();
}
