import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding3.g.dart';

class Onboarding3 {
  final  txtHeading = "find your destination";
  final  txtSubHeading =
      "Rent what you need, when you need it Sign up now for convenience!";
  final  txtSkip = "Skip";
}

@riverpod
Onboarding3 onboarding3(Onboarding3Ref ref) {
  return Onboarding3();
}
