import 'package:rent_hub/features/ads/service/object_box_service.dart';

/// Removes a recent search from the database
/// by its id
class RecentSearchRemoveUseCase {
  final db = ObjectBoxService.instance;

  void call({required int id}) {
    db.searchBox.remove(id);
  }
}
