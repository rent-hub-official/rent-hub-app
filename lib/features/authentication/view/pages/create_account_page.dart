import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/create_account_constants/create_account.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class CreateAccountPage extends ConsumerWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(ref.watch(createAccountProvider).txtHeading,
                style: theme.typography.h1SemiBold),
          ],
        ),
      ),
    );
  }
}
