import 'package:rent_hub/features/ads/domain/entity/recent_search_entity.dart';
import 'package:rent_hub/object_box_service.dart';
import 'package:rent_hub/objectbox.g.dart';

/// Adds a recent search to the database
/// if it does not already exist
class RecentSearchAddUseCase {
  final db = ObjectBoxService.instance;

  void call({required String recentSearch}) {
    final isExist = db.searchBox
        .query(RecentSearchEntity_.recentSearch.equals(
          recentSearch,
        ))
        .build()
        .find()
        .isEmpty;
    if (isExist) {
      db.searchBox.put(
        RecentSearchEntity(recentSearch: recentSearch),
      );
    }
  }
}
