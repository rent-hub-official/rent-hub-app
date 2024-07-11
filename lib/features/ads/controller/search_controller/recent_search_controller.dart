import 'package:rent_hub/features/ads/domain/entity/recent_search_entity.dart';
import 'package:rent_hub/features/ads/domain/usecase/recent_search_use_case/recent_search_add_use_case.dart';
import 'package:rent_hub/features/ads/domain/usecase/recent_search_use_case/recent_search_remove_all_use_case.dart';
import 'package:rent_hub/features/ads/domain/usecase/recent_search_use_case/recent_search_remove_use_case.dart';
import 'package:rent_hub/features/ads/service/object_box_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_search_controller.g.dart';

@riverpod
class RecentSearch extends _$RecentSearch {
  @override
  List<RecentSearchEntity> build() {
    return ObjectBoxService.instance.searchBox.getAll();
  }

  void add({required String recentSearch}) {
    RecentSearchAddUseCase()(recentSearch: recentSearch);

    state = ObjectBoxService.instance.searchBox.getAll();
  }

  void remove({required int id}) {
    RecentSearchRemoveUseCase()(id: id);

    state = ObjectBoxService.instance.searchBox.getAll();
  }

  void removeAll() {
    RecentSearchRemoveAllUseCase()();

    state = ObjectBoxService.instance.searchBox.getAll();
  }
}
