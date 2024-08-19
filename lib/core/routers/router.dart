import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rent_hub/core/routers/redirects.dart';
import 'package:rent_hub/features/navigation/view/pages/navigation_page.dart';
import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:rent_hub/features/ads/view/pages/add_product_page.dart';
import 'package:rent_hub/features/orders/view/pages/history_details_page.dart';
import 'package:rent_hub/features/ads/view/pages/home_page.dart';
import 'package:rent_hub/features/ads/view/pages/location_search_page.dart';
import 'package:rent_hub/features/ads/view/pages/location_selection_page.dart';
import 'package:rent_hub/features/ads/view/pages/my_products_page.dart';
import 'package:rent_hub/features/notification/view/pages/notification_page.dart';
import 'package:rent_hub/features/ads/view/pages/product_details_page/product_details_page.dart';
import 'package:rent_hub/features/ads/view/pages/search/search_page.dart';
import 'package:rent_hub/features/authentication/view/pages/create_account_page.dart';
import 'package:rent_hub/features/authentication/view/pages/login_page.dart';
import 'package:rent_hub/features/authentication/view/pages/onboarding/onboarding_pages.dart';
import 'package:rent_hub/features/authentication/view/pages/otp_verification_page.dart';
import 'package:rent_hub/features/authentication/view/pages/profile_page.dart';
import 'package:rent_hub/features/authentication/view/pages/profile_settings_page.dart';
import 'package:rent_hub/features/chat/view/pages/chat_details_page.dart';
import 'package:rent_hub/features/chat/view/pages/seller_profile_page.dart';
import 'package:rent_hub/features/favorites/view/pages/favorites_page.dart';
import 'package:rent_hub/features/payment/view/pages/add_bank_ac_details_page.dart';
import 'package:rent_hub/features/payment/view/pages/payment_failed_page.dart';
import 'package:rent_hub/main.dart';

final router = GoRouter(
  navigatorKey: App.navigatorKey,
  initialLocation: OnboardingPage.routePath,
  routes: [
    GoRoute(
      path: OnboardingPage.routePath,
      builder: (context, state) {
        return OnboardingPage();
      },
      redirect: RouterRedirectServices.checkFirstLaunch,
    ),
    GoRoute(
      path: OtpVerificationPage.routePath,
      builder: (context, state) {
        return const OtpVerificationPage();
      },
    ),
    GoRoute(
      path: LoginPage.routePath,
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: CreateAccountPage.routePath,
      builder: (context, state) {
        return const CreateAccountPage();
      },
    ),
    GoRoute(
      path: NavigationPage.routePath,
      builder: (context, state) {
        return const NavigationPage();
      },
      redirect: RouterRedirectServices.checkLoggedIn,
    ),
    GoRoute(
      path: HomePage.routePath,
      builder: (context, state) {
        return const HomePage();
      },
      redirect: RouterRedirectServices.checkLoggedIn,
    ),
    GoRoute(
      path: ProductDetailsPage.routePath,
      builder: (context, state) {
        return ProductDetailsPage(
          adsData: state.extra as AdsModel,
        );
      },
      redirect: RouterRedirectServices.checkLoggedIn,
    ),
    GoRoute(
      path: AddProductPage.routePath,
      builder: (context, state) {
        return const AddProductPage();
      },
      redirect: RouterRedirectServices.checkLoggedIn,
    ),
    GoRoute(
      path: MyProductsPage.routePath,
      builder: (context, state) {
        return const MyProductsPage();
      },
      redirect: RouterRedirectServices.checkLoggedIn,
    ),
    GoRoute(
      path: NotificationPage.routePath,
      builder: (context, state) {
        return const NotificationPage();
      },
      redirect: RouterRedirectServices.checkLoggedIn,
    ),
    GoRoute(
      path: ProfilePage.routePath,
      builder: (context, state) {
        return const ProfilePage();
      },
      redirect: RouterRedirectServices.checkLoggedIn,
    ),
    GoRoute(
      path: ProfileSettingsPage.routePath,
      builder: (context, state) {
        return const ProfileSettingsPage();
      },
      redirect: RouterRedirectServices.checkLoggedIn,
    ),
    GoRoute(
      path: FavoritesPage.routePath,
      builder: (context, state) {
        return const FavoritesPage();
      },
      redirect: RouterRedirectServices.checkLoggedIn,
    ),
    GoRoute(
      path: SearchPage.routePath,
      builder: (context, state) {
        return const SearchPage();
      },
      redirect: RouterRedirectServices.checkLoggedIn,
    ),
    GoRoute(
      path: AddBankAcDetailsPage.routePath,
      builder: (context, state) {
        return AddBankAcDetailsPage();
      },
      redirect: RouterRedirectServices.checkLoggedIn,
    ),
    GoRoute(
      path: ChatDetailsPage.routePath,
      builder: (context, state) {
        final extra = state.extra as Map;
        return ChatDetailsPage(
          image: extra['image']!,
          name: extra['name']!,
          receiverId: extra['receiverId']!,
          userId: extra['userId']!,
        );
      },
      redirect: RouterRedirectServices.checkLoggedIn,
    ),
    GoRoute(
      path: PaymentFailedPage.routePath,
      builder: (context, state) {
        return PaymentFailedPage();
      },
      redirect: RouterRedirectServices.checkLoggedIn,
    ),
    GoRoute(
      path: HistoryDetailsPage.routePath,
      builder: (context, state) {
        return HistoryDetailsPage();
      },
      redirect: RouterRedirectServices.checkLoggedIn,
    ),
    GoRoute(
      path: SellerProfilePage.routePath,
      builder: (context, state) {
        return SellerProfilePage(
          Userdata: state.extra as AdsModel,
        );
      },
      redirect: RouterRedirectServices.checkLoggedIn,
    ),
    GoRoute(
      path: LocationSearchPage.routePath,
      builder: (context, state) {
        return LocationSearchPage();
      },
      redirect: RouterRedirectServices.checkLoggedIn,
    ),
    GoRoute(
      path: LocationSelectionPage.routePath,
      builder: (context, state) {
        return LocationSelectionPage(
          latLng: state.extra as LatLng,
        );
      },
      redirect: RouterRedirectServices.checkLoggedIn,
    )
  ],
);
