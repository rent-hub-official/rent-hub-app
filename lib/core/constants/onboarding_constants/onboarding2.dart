import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'onboarding2.g.dart';

class Onboarding2 {
  final String txtHeading = "find your destination";
  final String txtSubHeading =
      "Rent what you need, when you need it Sign up now for convenience!";
  final String txtSkip = "Skip";
}

@riverpod
Onboarding2 onboarding2(Onboarding2Ref ref) {
  return Onboarding2();
}
