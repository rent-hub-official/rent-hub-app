import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'animation_constants.g.dart';

class AnimationConstants {
  static const animationPath = 'assets/lottie/';
  final animationEmpty = '${animationPath}no_products_found.json';
}

@riverpod
AnimationConstants animationConstants(AnimationConstantsRef ref) =>
    AnimationConstants();
