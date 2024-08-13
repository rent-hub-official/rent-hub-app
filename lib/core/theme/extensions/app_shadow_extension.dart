import 'package:flutter/material.dart';

/// This is the ThemeExtension used to add custom shadows into the app theme
class ShadowExtension extends ThemeExtension<ShadowExtension> {
  final BoxShadow primary;
  final BoxShadow secondary;

  ShadowExtension({required this.primary, required this.secondary});

  @override
  ThemeExtension<ShadowExtension> copyWith(
      {BoxShadow? primary, BoxShadow? secondary}) {
    return ShadowExtension(
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary);
  }

  @override
  ThemeExtension<ShadowExtension> lerp(
      covariant ThemeExtension<ShadowExtension>? other, double t) {
    if (other is! ShadowExtension) {
      return this;
    }
    return ShadowExtension(
        primary: BoxShadow.lerp(primary, other.primary, t)!,
        secondary: BoxShadow.lerp(secondary, other.secondary, t)!);
  }
}
