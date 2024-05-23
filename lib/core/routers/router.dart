import 'package:go_router/go_router.dart';
import 'package:rent_hub/features/authentication/view/pages/home_page.dart';
import 'package:rent_hub/features/authentication/view/pages/login_page.dart';
import 'package:rent_hub/features/authentication/view/pages/otp_verification_screen.dart';
import 'package:rent_hub/features/authentication/view/pages/splash_page.dart';
import 'package:rent_hub/main.dart';

final router = GoRouter(
  navigatorKey: MainApp.navigatorKey,
  initialLocation: SplashPage.routePath,
  routes: [
    GoRoute(
      // path: OtpVerificationScreen.routePath,
      builder: (context, state) {
        return const OtpVerificationScreen();
      },
    ),
    GoRoute(
      // path: LoginPage.routePath,
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      // path: HomePage.routePath,
      builder: (context, state) {
        return const HomePage();
      },
    ),
  ],
);
