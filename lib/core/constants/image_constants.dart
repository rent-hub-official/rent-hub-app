import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_constants.g.dart';

class ImageConstants {
  static const imagePath = "assets/images/img_";

  final imgLogo = "${imagePath}rent_logo.svg";
  final imgOnboarding1 = "${imagePath}onboarding1.svg";
  final imgOnboarding2 = "${imagePath}onboarding2.svg";
  final imgOnboarding3 = "${imagePath}onboarding3.svg";
  final imgOtpGirl = "${imagePath}otp_girl.svg";
  final imgSuccessful = "${imagePath}otp_girl.svg";
 
 
}

@riverpod
ImageConstants imageConstants(ImageConstantsRef ref) {
  return ImageConstants();
}
