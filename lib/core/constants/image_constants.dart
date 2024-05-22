import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_constants.g.dart';

class ImageConstants {
  static const imagePath = "assets/images/img_";

  final imgLogo = "${imagePath}rent_logo.png";
  final imgOnboarding1 = "${imagePath}onboarding1.png";
  final imgOnboarding2 = "${imagePath}onboarding2.png";
  final imgOnboarding3 = "${imagePath}onboarding3.png";
 
}

@riverpod
ImageConstants imageConstants(ImageConstantsRef ref) {
  return ImageConstants();
}
