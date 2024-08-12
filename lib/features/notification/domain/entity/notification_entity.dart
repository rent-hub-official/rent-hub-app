import 'package:objectbox/objectbox.dart';

@Entity()
class NotificationEntity {
  @Id()
  int id;

  String title;
  String subTitle;

  NotificationEntity({
    this.id = 0,
    required this.title,
    required this.subTitle,
  });
}
