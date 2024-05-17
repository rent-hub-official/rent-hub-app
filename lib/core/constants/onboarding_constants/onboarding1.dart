import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'onboarding1.g.dart';

class Onboarding1 {
  final String txtHeading = "Rent anything ";
  final String txtSubHeading =
      "Rent what you need, when you need it Sign up now for convenience!";
  final String txtSkip = "Skip";
}

@riverpod
Onboarding1 onboarding1(Onboarding1Ref ref) {
  return Onboarding1();
}
