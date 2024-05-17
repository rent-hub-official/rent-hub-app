import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_search_detailes.g.dart';

class UserSearchDetailes {
  final String txtSearch = "search";
  final String txtRecentSearch = "Recent Search";
  final String txtbtn = "Clear All";
  final String txtShowing = "Showing";
  final String txtresult = "results";
}

@riverpod
UserSearchDetailes userSearchDetailes(UserSearchDetailesRef ref) {
  return UserSearchDetailes();
}
