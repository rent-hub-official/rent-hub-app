import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'icon_constants.g.dart';

class IconConstants {
  static const iconPath = "assets/icons/ic_";

  final icProfile = "${iconPath}profile.png";

}

@riverpod
IconConstants iconConstants(IconConstantsRef ref) {
  return IconConstants();
}
