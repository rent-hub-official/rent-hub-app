// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:objectbox/objectbox.dart';

@Entity()
class RecentSearchEntity {
  @Id()
  int id;

  String recentSearch;
  RecentSearchEntity({
    this.id = 0,
    required this.recentSearch,
  });
}
