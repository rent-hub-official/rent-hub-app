import 'package:flutter/material.dart';
import 'package:rent_hub/features/authentication/view/pages/create_account_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/theme/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ref.watch(themeProvider),
      home: const CreateAccountPage(),
    );
  }
}
