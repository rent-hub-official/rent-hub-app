import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/theme/extensions/app_color_extension.dart';
import 'package:rent_hub/core/theme/extensions/app_shadow_extension.dart';
import 'package:rent_hub/core/theme/extensions/app_typography_extension.dart';
import 'package:rent_hub/core/theme/extensions/space_extension.dart';

final lighttheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColorPalettes.grey100,
    appBarTheme: const AppBarTheme(backgroundColor: AppColorPalettes.grey100),
    fontFamily: 'Poppins',
    extensions: [
      /// AppColorExtension
      AppColorExtension(
        primary: AppColorPalettes.yellow600,
        secondary: AppColorPalettes.blueGrey800,
        text: AppColorPalettes.grey850,
        textSubtle: AppColorPalettes.grey200,
        btnText: AppColorPalettes.white500,
        border: AppColorPalettes.grey600,
        bottomNavBorder: AppColorPalettes.grey600,
        cardBackground: AppColorPalettes.white500,
        messageBackground: AppColorPalettes.grey350,
        appBarBackground: AppColorPalettes.grey100,
        iconButtonBackgroud: AppColorPalettes.white500,
        iconButtonIcon: AppColorPalettes.black500,
        bottomNavBar: AppColorPalettes.grey100,
        dialogBackground: AppColorPalettes.grey950,
      ),

      ///AppSpaceExtension
      AppSpaceExtension.fromBaseSpace(8),

      ///AppTypographyExtension
      AppTypographyExtension(
        body: const TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            color: AppColorPalettes.black500,
            fontWeight: FontWeight.w500),
        bodyWhite: const TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            color: AppColorPalettes.white500,
            fontWeight: FontWeight.w500),
        bodyLarge: const TextStyle(
            fontSize: 18,
            fontFamily: 'Poppins',
            color: AppColorPalettes.black500,
            fontWeight: FontWeight.w500),
        bodySemibold: const TextStyle(
            fontSize: 14,
            fontFamily: 'Poppins',
            color: AppColorPalettes.black500,
            fontWeight: FontWeight.w600),
        bodyLargeSemiBold: const TextStyle(
            fontSize: 18,
            fontFamily: 'Poppins',
            color: AppColorPalettes.black500,
            fontWeight: FontWeight.w600),
        bodySmall: const TextStyle(
            fontSize: 10,
            fontFamily: 'Poppins',
            color: AppColorPalettes.black500,
            fontWeight: FontWeight.w500),
        bodySmallSemiBold: const TextStyle(
            fontSize: 10,
            fontFamily: 'Poppins',
            color: AppColorPalettes.black500,
            fontWeight: FontWeight.w600),
        h1: const TextStyle(
            fontSize: 32,
            fontFamily: 'Poppins',
            color: AppColorPalettes.black500,
            fontWeight: FontWeight.w500),
        h1SemiBold: const TextStyle(
            fontSize: 32,
            fontFamily: 'Poppins',
            color: AppColorPalettes.black500,
            fontWeight: FontWeight.w600),
        h1Bold: const TextStyle(
            fontSize: 32,
            fontFamily: 'Poppins',
            color: AppColorPalettes.black500,
            fontWeight: FontWeight.w700),
        h2: const TextStyle(
            fontSize: 24,
            fontFamily: 'Poppins',
            color: AppColorPalettes.black500,
            fontWeight: FontWeight.w500),
        h2SemiBold: const TextStyle(
            fontSize: 24,
            fontFamily: 'Poppins',
            color: AppColorPalettes.black500,
            fontWeight: FontWeight.w600),
        h2Bold: const TextStyle(
            fontSize: 24,
            fontFamily: 'Poppins',
            color: AppColorPalettes.black500,
            fontWeight: FontWeight.w700),
        h3: const TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            color: AppColorPalettes.black500,
            fontWeight: FontWeight.w500),
        h3SemiBold: const TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            color: AppColorPalettes.black500,
            fontWeight: FontWeight.w600),
        h3Bold: const TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            color: AppColorPalettes.black500,
            fontWeight: FontWeight.w700),
        buttonText: const TextStyle(
          fontSize: 14,
          fontFamily: 'Poppins',
          color: AppColorPalettes.white500,
          fontWeight: FontWeight.w600,
        ),
      ),

      ///AppShadowExtension
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
