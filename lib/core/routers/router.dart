import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/widgets/bottom_nav/bottom_nav_widget.dart';
import 'package:rent_hub/features/ads/view/pages/add_product_page.dart';
import 'package:rent_hub/features/ads/view/pages/my_products_page.dart';
import 'package:rent_hub/features/ads/view/pages/notification_page.dart';
import 'package:rent_hub/features/ads/view/pages/product_details_page/product_details_page.dart';
import 'package:rent_hub/features/authentication/view/pages/create_account_page.dart';
import 'package:rent_hub/features/authentication/view/pages/home_page.dart';
import 'package:rent_hub/features/authentication/view/pages/login_page.dart';
import 'package:rent_hub/features/authentication/view/pages/onboarding/onboarding_pages.dart';
import 'package:rent_hub/features/authentication/view/pages/otp_verification_screen.dart';
import 'package:rent_hub/features/authentication/view/pages/profile_page.dart';
import 'package:rent_hub/features/authentication/view/pages/profile_settings_page.dart';
import 'package:rent_hub/features/authentication/view/pages/splash_page.dart';
import 'package:rent_hub/features/chat/view/pages/chat_details_page.dart';
import 'package:rent_hub/features/favorites/view/pages/favorites_page.dart';
import 'package:rent_hub/features/payment/pages/add_bank_ac_details_page.dart';
import 'package:rent_hub/features/payment/pages/payment_failed_page.dart';
import 'package:rent_hub/main.dart';

final router = GoRouter(
  navigatorKey: MyApp.navigatorKey,
  initialLocation: SplashPage.routePath,
  // initialLocation: OnboardingPages.routePath,
  // redirect: (context, state) {
  //   // TODO : rediretion user status
  //   return '';
  // },
  routes: [
    GoRoute(
      path: SplashPage.routePath,
      builder: (context, state) {
        return SplashPage();
      },
    ),
    GoRoute(
      path: OnBoardingPages.routePath,
      builder: (context, state) {
        return OnBoardingPages();
      },
    ),
    GoRoute(
      path: OtpVerificationScreen.routePath,
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
    GoRoute(
      path: ProductDetailsPage.routePath,
      builder: (context, state) {
        return const ProductDetailsPage();
      },
    ),
    GoRoute(
      path: AddProductPage.routePath,
      builder: (context, state) {
        return const AddProductPage();
      },
    ),
    GoRoute(
      path: MyProductsPage.routePath,
      builder: (context, state) {
        return const MyProductsPage();
      },
    ),
    GoRoute(
      path: NotificationPage.routePath,
      builder: (context, state) {
        return const NotificationPage();
      },
    ),
    GoRoute(
      path: CreateAccountPage.routePath,
      builder: (context, state) {
        return const CreateAccountPage();
      },
    ),
    GoRoute(
      path: ProfilePage.routePath,
      builder: (context, state) {
        return const ProfilePage();
      },
    ),
    GoRoute(
      path: ProfileSettingsPage.routePath,
      builder: (context, state) {
        return const ProfileSettingsPage();
      },
    ),
    GoRoute(
      path: FavoritesPage.routePath,
      builder: (context, state) {
        return const FavoritesPage();
      },
    ),
    GoRoute(
      path: AddBankAcDetailsPage.routePath,
      builder: (context, state) {
        return AddBankAcDetailsPage();
      },
    ),
    GoRoute(
      path: ChatDetailsPage.routePath,
      builder: (context, state) {
        return ChatDetailsPage();
      },
    ),
    GoRoute(
      path: PaymentFailedPage.routePath,
      builder: (context, state) {
        return PaymentFailedPage();
      },
    ),
  ],
);
