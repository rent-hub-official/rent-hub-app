import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_search_details.g.dart';

class UserSearchDetailsConstants {
  final txtSearch = "Search";
  final txtRecentSearch = "Recent Search";
  final txtbtn = "Clear All";
  final txtShowing = "Showing";
  final txtresult = "results";
}

@riverpod
UserSearchDetailsConstants userSearchDetailsConstants(
    UserSearchDetailsConstantsRef ref) {
  return UserSearchDetailsConstants();
}
