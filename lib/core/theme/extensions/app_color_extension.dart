import 'package:flutter/material.dart';

// App default colors

class AppColorExtension extends ThemeExtension<AppColorExtension> {
  final Color primary;
  final Color secondary;
  final Color text;
  final Color textSubtle;
  final Color btnText;
  final Color border;
  final Color bottomNavBorder;
  final Color appBarBackground;
  final Color cardBackground;
  final Color iconButtonBackgroud;
  final Color iconButtonIcon;

  AppColorExtension({
    required this.appBarBackground,
    required this.primary,
    required this.secondary,
    required this.text,
    required this.textSubtle,
    required this.btnText,
    required this.border,
    required this.bottomNavBorder,
    required this.cardBackground,
    required this.iconButtonBackgroud,
    required this.iconButtonIcon,
  });

  @override
  ThemeExtension<AppColorExtension> copyWith({
    Color? primary,
    Color? secondary,
    Color? text,
    Color? textSubtle,
    Color? btnText,
    Color? border,
    Color? bottomNavBorder,
    Color? cardBackground,
    Color? appBarBackground,
    Color? iconButtonBackgroud,
    Color? iconButtonIcon,
  }) {
    return AppColorExtension(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      text: text ?? this.text,
      textSubtle: textSubtle ?? this.textSubtle,
      btnText: btnText ?? this.btnText,
      border: border ?? this.border,
      bottomNavBorder: bottomNavBorder ?? this.bottomNavBorder,
      appBarBackground: appBarBackground ?? this.appBarBackground,
      cardBackground: cardBackground ?? this.cardBackground,
      iconButtonBackgroud: iconButtonBackgroud ?? this.iconButtonBackgroud,
      iconButtonIcon: iconButtonIcon ?? this.iconButtonBackgroud,
    );
  }

  @override
  ThemeExtension<AppColorExtension> lerp(
      covariant ThemeExtension<AppColorExtension>? other, double t) {
    if (other is! AppColorExtension) {
      return this;
    }
    return AppColorExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      text: Color.lerp(text, other.text, t)!,
      textSubtle: Color.lerp(textSubtle, other.textSubtle, t)!,
      btnText: Color.lerp(btnText, other.btnText, t)!,
      border: Color.lerp(border, other.border, t)!,
      bottomNavBorder: Color.lerp(bottomNavBorder, other.bottomNavBorder, t)!,
      appBarBackground:
          Color.lerp(appBarBackground, other.appBarBackground, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      iconButtonBackgroud:
          Color.lerp(iconButtonBackgroud, other.iconButtonBackgroud, t)!,
      iconButtonIcon: Color.lerp(iconButtonIcon, other.iconButtonIcon, t)!,
    );
  }
}
