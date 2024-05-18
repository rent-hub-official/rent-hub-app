import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_search_detailes.g.dart';

class UserSearchDetailes {
  final txtSearch = "search";
  final txtRecentSearch = "Recent Search";
  final txtbtn = "Clear All";
  final txtShowing = "Showing";
  final txtresult = "results";
}

@riverpod
UserSearchDetailes userSearchDetailes(UserSearchDetailesRef ref) {
  return UserSearchDetailes();
}
