import 'package:flutter/material.dart';

// App default typographys

class AppTypographyExtension extends ThemeExtension<AppTypographyExtension> {
  final TextStyle body;
  final TextStyle bodyWhite;
  final TextStyle bodySemibold;
  final TextStyle bodyLarge;
  final TextStyle bodyLargeSemiBold;
  final TextStyle bodySmall;
  final TextStyle bodySmallSemiBold;
  final TextStyle h1;
  final TextStyle h1SemiBold;
  final TextStyle h1Bold;
  final TextStyle h2;
  final TextStyle h2SemiBold;
  final TextStyle h2Bold;
  final TextStyle h3;
  final TextStyle h3SemiBold;
  final TextStyle h3Bold;
  final TextStyle buttonText;

  AppTypographyExtension({
    required this.body,
    required this.bodyWhite,
    required this.bodyLarge,
    required this.bodySemibold,
    required this.bodyLargeSemiBold,
    required this.bodySmall,
    required this.bodySmallSemiBold,
    required this.h1,
    required this.h1SemiBold,
    required this.h1Bold,
    required this.h2,
    required this.h2SemiBold,
    required this.h2Bold,
    required this.h3,
    required this.h3SemiBold,
    required this.h3Bold,
    required this.buttonText,
  });

  @override
  ThemeExtension<AppTypographyExtension> copyWith({
    TextStyle? body,
    TextStyle? bodyWhite,
    TextStyle? bodySemibold,
    TextStyle? bodyLarge,
    TextStyle? bodyLargeSemiBold,
    TextStyle? bodySmall,
    TextStyle? bodySmallSemiBold,
    TextStyle? h1,
    TextStyle? h1SemiBold,
    TextStyle? h1Bold,
    TextStyle? h2,
    TextStyle? h2SemiBold,
    TextStyle? h2Bold,
    TextStyle? h3,
    TextStyle? h3SemiBold,
    TextStyle? h3Bold,
    TextStyle? buttonText,
  }) {
    return AppTypographyExtension(
      body: body ?? this.body,
      bodyWhite: bodyWhite ?? this.bodyWhite,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodySemibold: bodySemibold ?? this.bodySemibold,
      bodyLargeSemiBold: bodyLargeSemiBold ?? this.bodyLargeSemiBold,
      bodySmall: bodySmall ?? this.bodySmall,
      bodySmallSemiBold: bodySmallSemiBold ?? this.bodySmallSemiBold,
      h1: h1 ?? this.h1,
      h1SemiBold: h1SemiBold ?? this.h1SemiBold,
      h1Bold: h1Bold ?? this.h1Bold,
      h2: h2 ?? this.h2,
      h2SemiBold: h2SemiBold ?? this.h2SemiBold,
      h2Bold: h2Bold ?? this.h2Bold,
      h3: h3 ?? this.h3,
      h3SemiBold: h3SemiBold ?? this.h3SemiBold,
      h3Bold: h3Bold ?? this.h3Bold,
      buttonText: buttonText ?? this.buttonText,
    );
  }

  @override
  ThemeExtension<AppTypographyExtension> lerp(
      covariant ThemeExtension<AppTypographyExtension>? other, double t) {
    if (other is! AppTypographyExtension) {
      return this;
    }
    return AppTypographyExtension(
      body: TextStyle.lerp(body, other.body, t)!,
      bodyWhite: TextStyle.lerp(bodyWhite, other.bodyWhite, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      bodySemibold: TextStyle.lerp(bodySemibold, other.bodySemibold, t)!,
      bodyLargeSemiBold:
          TextStyle.lerp(bodyLargeSemiBold, other.bodyLargeSemiBold, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      bodySmallSemiBold:
          TextStyle.lerp(bodySmallSemiBold, other.bodySmallSemiBold, t)!,
      h1: TextStyle.lerp(h1, other.h1, t)!,
      h1SemiBold: TextStyle.lerp(h1SemiBold, other.h1SemiBold, t)!,
      h1Bold: TextStyle.lerp(h1Bold, other.h1Bold, t)!,
      h2: TextStyle.lerp(h2, other.h2, t)!,
      h2SemiBold: TextStyle.lerp(h2SemiBold, other.h2SemiBold, t)!,
      h2Bold: TextStyle.lerp(h2Bold, other.h2Bold, t)!,
      h3: TextStyle.lerp(h3, other.h3, t)!,
      h3SemiBold: TextStyle.lerp(h3SemiBold, other.h3SemiBold, t)!,
      h3Bold: TextStyle.lerp(h3Bold, other.h3Bold, t)!,
      buttonText: TextStyle.lerp(buttonText, other.buttonText, t)!,
    );
  }
}
