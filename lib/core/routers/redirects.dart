import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/features/ads/view/pages/home_page.dart';
import 'package:rent_hub/features/authentication/view/pages/create_account_page.dart';
import 'package:rent_hub/features/authentication/view/pages/login_page.dart';
import 'package:rent_hub/features/authentication/view/pages/onboarding/onboarding_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaunchService {
  static const String _firstLaunchKey = 'first_launch';

  Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_firstLaunchKey) ?? true; // Default to true if not set
  }

  Future<void> completeFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_firstLaunchKey, false);
  }
}

Future<String?> checkFirstLaunchAndLogin(
    BuildContext context, GoRouterState state) async {
  final isLoggedIn = FirebaseAuth.instance.currentUser != null;
  final launchService = LaunchService();
  final isFirstLaunch = await launchService.isFirstLaunch();

  if (isFirstLaunch && state.path != OnboardingPages.routePath) {
    return OnboardingPages.routePath;
  }

  if (isLoggedIn &&
      (state.path == LoginPage.routePath ||
          state.path == OnboardingPages.routePath ||
          state.path == CreateAccountPage.routePath)) {
    return HomePage.routePath;
  }

  if (!isLoggedIn &&
      state.path != LoginPage.routePath &&
      state.path != OnboardingPages.routePath) {
    return LoginPage.routePath;
  }

  return null; // No redirection needed
}

/// Check if the user is logged in.
///
/// If user is not logged in, redirect to the Login Page
/// If user is already logged in, then do not redirect to any page
String? checkLoggedIn(BuildContext context, GoRouterState state) {
  final isUserNotLoggedIn = FirebaseAuth.instance.currentUser == null;

  if (isUserNotLoggedIn) {
    return LoginPage.routePath;
  }

  return null;
}
