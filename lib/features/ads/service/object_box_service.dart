import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rent_hub/features/ads/domain/entity/recent_search_entity.dart';
import 'package:rent_hub/objectbox.g.dart';

final class ObjectBoxService {
  /// The Store of this app.
  late final Store store;

  static ObjectBoxService? _instance;

  static ObjectBoxService get instance {
    return _instance!;
  }

  late final Box<RecentSearchEntity> searchBox;
  ObjectBoxService._create(this.store) {
    searchBox = store.box<RecentSearchEntity>();
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<void> create() async {
    if (_instance == null) {
      final docsDir = await getApplicationDocumentsDirectory();
      final store = await openStore(directory: join(docsDir.path, "subfolder"));
      _instance = ObjectBoxService._create(store);
    }
  }
}
