

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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Text(
                ref.watch(createAccountProvider).txtHeading,
                style: theme.typography.h1SemiBold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: theme.spaces.space_200 * 6,
                    ),
                    const Positioned(
                      bottom: 10,
                      right: 10,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Container(
                height: 58,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.colors.primary,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  ref.watch(createAccountProvider).txtSubtitle,
                  style: theme.typography.bodySmall,
                ),
              ),
              const SizedBox(height: 35),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.colors.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    ref.watch(createAccountProvider).txtbtn,
                    style: theme.typography.buttonText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
