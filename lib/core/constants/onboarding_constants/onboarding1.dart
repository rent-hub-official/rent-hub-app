import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'onboarding1.g.dart';

class Onboarding1 {
  final  txtHeading = "Rent anything ";
  final  txtSubHeading =
      "Rent what you need, when you need it Sign up now for convenience!";
  final  txtSkip = "Skip";
}

@riverpod
Onboarding1 onboarding1(Onboarding1Ref ref) {
  return Onboarding1();
}
