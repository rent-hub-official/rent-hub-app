import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/widgets/bottom_nav/bottom_nav_widget.dart';
import 'package:rent_hub/features/authentication/view/pages/login_page.dart';

/// A service class that is used to redirect the user to a specific page.
///
/// e.g. If the user is not logged in, then redirect the user to the login page.
/// or if the user is openeing the app for the first time, then redirect the user to the onboarding page,
/// etc.
class RouterRedirectServices {
  /// This is the storage box that is used to store the redirect related data
  /// into the local storage.
  static final _storage = GetStorage();

  /// A key that is used in the local storage to indicate that the user is
  /// already completed the onborading screen.
  ///
  /// The value can be either `true` or `false`.
  /// If the value is `true`, then the user has already completed the onboarding screen.
  /// If the value is `false`, then the user has not completed the onboarding screen.
  /// If there is no value, then the user has not completed the onboarding screen.
  static const String _isFirstLaunchStorageKey = 'is_first_launch';

  /// Check if the user is opening the app for the first time.
  ///
  /// If the user already completed the onboarding screen, then redirect the user to
  /// the app home page.
  ///
  /// If the user is not opening the app for the first time, then do not redirect the user to any page.
  static String? checkFirstLaunch(BuildContext context, GoRouterState state) {
    final bool isFirstLaunch =
        _storage.read<bool>(_isFirstLaunchStorageKey) ?? false;

    if (!isFirstLaunch) {
      return MainPage.routePath;
    }

    return null;
  }

  /// Mark the user as completed the onboarding screen.
  ///
  /// Once this is called, the user will not be redirected to the onboarding screen again.
  static void markFirstLaunchCompleted() {
    _storage.write(_isFirstLaunchStorageKey, true);
  }

  /// Check if the user is logged in.
  ///
  /// If the user is not logged in, then redirect the user to the login page.
  /// If the user is already logged in, then do not redirect the user to any page.
  static String? checkLoggedIn(BuildContext context, GoRouterState state) {
    final isUserNotLoggedIn = FirebaseAuth.instance.currentUser == null;

    if (isUserNotLoggedIn) {
      return LoginPage.routePath;
    }

    return null;
  }
}
