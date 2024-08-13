import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rent_hub/core/theme/dark_theme.dart';
import 'package:rent_hub/core/theme/light_theme.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  /// This is the local storage used to store the theme preference
  final GetStorage _storage = GetStorage();

  /// The key used to store the current theme saved by the user into the
  /// local storage
  static const String _currentThemeKey = 'saved-theme';

  @override
  ThemeData build() {
    /// Check the system theme first, then if the user has manually set a theme
    /// in the app settings, them use that theme.
    ///
    /// Else use the system theme as the default theme for the app.
    Brightness systemBrightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;

    /// Theme saved by the user
    String? savedTheme = _storage.read<String>(_currentThemeKey);

    if (savedTheme == null) {
      return systemBrightness == Brightness.light ? lighttheme : darktheme;
    } else {
      return savedTheme == 'light' ? lighttheme : darktheme;
    }
  }

  /// Switch the theme of the app between light and dark themes
  void switchTheme() {
    if (state.brightness == Brightness.light) {
      state = darktheme;
    } else {
      state = lighttheme;
    }
  }
}
