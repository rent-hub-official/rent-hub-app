import 'package:rent_hub/features/notification/domain/entity/notification_entity.dart';
import 'package:rent_hub/features/notification/domain/use_case/recent_search_use_case/notification_add_use_case.dart';
import 'package:rent_hub/features/notification/domain/use_case/recent_search_use_case/notification_remove_all_use_case.dart';
import 'package:rent_hub/features/notification/domain/use_case/recent_search_use_case/notification_remove_use_case.dart';
import 'package:rent_hub/object_box_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_list_controller.g.dart';

@riverpod
class NotificationsList extends _$NotificationsList {
  @override
  List<NotificationEntity> build() {
    return ObjectBoxService.instance.notificationBox.getAll();
  }

  void add({required String title, required String subTitle}) {
    NotificationAddUseCase()(title: title, subTitle: subTitle);

    state = ObjectBoxService.instance.notificationBox.getAll();
  }

  void remove({required int id}) {
    NotificationRemoveUseCase()(id: id);

    state = ObjectBoxService.instance.notificationBox.getAll();
  }

  void removeAll() {
    NotificationRemoveAllUseCase()();

    state = ObjectBoxService.instance.notificationBox.getAll();
  }
}
