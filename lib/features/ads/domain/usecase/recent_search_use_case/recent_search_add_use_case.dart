import 'package:rent_hub/features/ads/domain/entity/recent_search_entity.dart';
import 'package:rent_hub/features/ads/service/object_box_service.dart';

class RecentSearchAddUseCase {
  final db = ObjectBoxService.instance;

  void call({required String recentSearch}) {
    db.searchBox.put(
      RecentSearchEntity(recentSearch: recentSearch),
    );
  }
}
