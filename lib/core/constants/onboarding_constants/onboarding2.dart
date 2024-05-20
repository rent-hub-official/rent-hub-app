import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'onboarding2.g.dart';

class Onboarding2 {
  final  txtHeading = "find your destination";
  final  txtSubHeading =
      "Rent what you need, when you need it Sign up now for convenience!";
  final  txtSkip = "Skip";
}

@riverpod
Onboarding2 onboarding2(Onboarding2Ref ref) {
  return Onboarding2();
}
