import 'package:objectbox/objectbox.dart';

@Entity()
class SelectedLocationEntity {
  @Id(assignable: true)
  int id;

  String mainText;
  String secondaryText;

  SelectedLocationEntity({
    this.id = 1,
    required this.mainText,
    required this.secondaryText,
  });
}
