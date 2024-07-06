import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/features/authentication/view/pages/login_page.dart';

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
