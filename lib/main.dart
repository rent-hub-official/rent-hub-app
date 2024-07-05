import 'package:algolia/algolia.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/routers/router.dart';
import 'package:rent_hub/core/theme/theme_provider.dart';
import 'package:rent_hub/features/ads/service/object_box_service.dart';
import 'package:rent_hub/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ObjectBoxService.create();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final scaffoldMessngerKey = GlobalKey<ScaffoldMessengerState>();

  static final algolia = Algolia.init(
    apiKey: "90b7be2c616a06a09f1522e7ebfa9d0b",
    applicationId: "ZE3ZISY1UL",
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
