import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'icon_constants.g.dart';

class IconConstants {
  static const iconPath = "assets/images/ic_";

  final icProfile = "${iconPath}profile.svg";

}

@riverpod
IconConstants iconConstants(IconConstantsRef ref) {
  return IconConstants();
}
