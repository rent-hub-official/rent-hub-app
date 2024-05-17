import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/theme/extensions/app_color_extension.dart';
import 'package:rent_hub/core/theme/extensions/app_shadow_extension.dart';
import 'package:rent_hub/core/theme/extensions/app_typography_extension.dart';
import 'package:rent_hub/core/theme/extensions/space_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dark_theme.g.dart';

final _darktheme = ThemeData(brightness: Brightness.dark, extensions: [
  //AppColoExtension
  AppColorExtension(
    primary: AppColorPalettes.yellow600,
    secondary: AppColorPalettes.blueGrey800,
    text: AppColorPalettes.grey850,
    textSubtle: AppColorPalettes.grey200,
    btnText: AppColorPalettes.black500,
    border: AppColorPalettes.silver300,
    bottomNavBorder: AppColorPalettes.grey600,
    cardBackground: AppColorPalettes.grey900,
  ),
  //AppSpaceExtension
  AppSpaceExtension.fromBaseSpace(8),
  //AppTypographyExtension
  AppTypographyExtension(
    body: GoogleFonts.poppins(
      fontSize: 14,
      color: AppColorPalettes.white500,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 18,
      color: AppColorPalettes.white500,
      fontWeight: FontWeight.w500,
    ),
    bodySemibold: GoogleFonts.poppins(
      fontSize: 14,
      color: AppColorPalettes.white500,
      fontWeight: FontWeight.w600,
    ),
    bodyLargeSemiBold: GoogleFonts.poppins(
      fontSize: 18,
      color: AppColorPalettes.white500,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 10,
      color: AppColorPalettes.white500,
      fontWeight: FontWeight.w500,
    ),
    bodySmallSemiBold: GoogleFonts.poppins(
      fontSize: 10,
      color: AppColorPalettes.white500,
      fontWeight: FontWeight.w600,
    ),
    h1: GoogleFonts.poppins(
      fontSize: 32,
      color: AppColorPalettes.white500,
      fontWeight: FontWeight.w500,
    ),
    h1SemiBold: GoogleFonts.poppins(
      fontSize: 32,
      color: AppColorPalettes.white500,
      fontWeight: FontWeight.w600,
    ),
    h1Bold: GoogleFonts.poppins(
      fontSize: 32,
      color: AppColorPalettes.white500,
      fontWeight: FontWeight.w700,
    ),
    h2: GoogleFonts.poppins(
      fontSize: 24,
      color: AppColorPalettes.white500,
      fontWeight: FontWeight.w500,
    ),
    h2SemiBold: GoogleFonts.poppins(
      fontSize: 24,
      color: AppColorPalettes.white500,
      fontWeight: FontWeight.w600,
    ),
    h2Bold: GoogleFonts.poppins(
      fontSize: 24,
      color: AppColorPalettes.white500,
      fontWeight: FontWeight.w700,
    ),
    h3: GoogleFonts.poppins(
      fontSize: 20,
      color: AppColorPalettes.white500,
      fontWeight: FontWeight.w500,
    ),
    h3SemiBold: GoogleFonts.poppins(
      fontSize: 20,
      color: AppColorPalettes.white500,
      fontWeight: FontWeight.w600,
    ),
    h3Bold: GoogleFonts.poppins(
      fontSize: 20,
      color: AppColorPalettes.white500,
      fontWeight: FontWeight.w700,
    ),
    buttonText: GoogleFonts.poppins(
      fontSize: 14,
      color: AppColorPalettes.white500,
      fontWeight: FontWeight.w600,
    ),
  ),
  //AppShadowExtension
  ShadowExtension(
      primary: const BoxShadow(
        blurRadius: 1,
        spreadRadius: 0,
        color: AppColorPalettes.grey600,
      ),
      secondary: const BoxShadow(
        blurRadius: 1,
        spreadRadius: 0,
        color: AppColorPalettes.grey600,
      )),
]);

@riverpod
ThemeData darkTheme(DarkThemeRef ref) {
  return _darktheme;
}
