import 'package:algolia/algolia.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/routers/router.dart';
import 'package:rent_hub/core/secret_keys.dart';
import 'package:rent_hub/core/theme/theme_provider.dart';
import 'package:rent_hub/features/ads/service/object_box_service.dart';
import 'package:rent_hub/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ObjectBoxService.create();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
    null,
    [
      NotificationChannel(
        channelGroupKey: 'renthub_channel_group',
        channelKey: 'renthub_channel',
        channelName: 'renthub notifications',
        channelDescription: 'Notification channel for tests',
        defaultColor: Color(0xFF9D50DD), //Todo: change color
        ledColor: Colors.white,
      ),
    ],
    // Channel groups are only visual and are not required
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: 'renthub_channel_group',
        channelGroupName: 'renthub group',
      )
    ],
    debug: true,
  );

  AwesomeNotifications().isNotificationAllowed().then(
    (isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    },
  );

  // You may set the permission requests to "provisional" which allows the user to choose what type
  // of notifications they would like to receive once the user receives a notification.
  final notificationSettings =
      await FirebaseMessaging.instance.requestPermission(provisional: true);

  // For apple platforms, ensure the APNS token is available before making any FCM plugin API calls
  final apnsToken = await FirebaseMessaging.instance.getAPNSToken();
  if (apnsToken != null) {
    // APNS token is available, make FCM plugin API requests...
  }

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final scaffoldMessngerKey = GlobalKey<ScaffoldMessengerState>();

  static final algolia = Algolia.init(
    apiKey: SecretKeys.algoliaApiKey,
    applicationId: SecretKeys.algoliaApplicationId,
  );

  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: scaffoldMessngerKey,
      routerConfig: router,
      theme: ref.watch(themeProvider),
    );
  }
}
