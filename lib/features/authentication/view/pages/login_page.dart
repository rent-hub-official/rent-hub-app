import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rent_hub/core/constants/login_page_constants/login_page_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final spaces = AppTheme.of(context).spaces;
    final constants = ref.watch(loginPageConstantProvider);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(spaces.space_200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/img_loginPage.png'),
              SizedBox(
                height: spaces.space_100,
              ),
              Text(
                constants.txtHeading,
                style: typography.h2SemiBold,
              ),
              SizedBox(
                height: spaces.space_100,
              ),
              Text(
                constants.txtSubHeding,
                style: typography.h3,
              ),
              SizedBox(
                height: spaces.space_100,
              ),
              IntlPhoneField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'e.g:"9876543210"',
                  labelText: 'Enter your Phone Number',
                  contentPadding: EdgeInsets.only(
                    bottom: spaces.space_200,
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
