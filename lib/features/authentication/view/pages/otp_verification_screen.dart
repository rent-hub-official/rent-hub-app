import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:rent_hub/core/constants/login_page_constants/login_otp_verification.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class OtpVerificationScreen extends ConsumerWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: NetworkImage(
                    'https://t4.ftcdn.net/jpg/01/89/81/53/360_F_189815309_AIuYLElRzXQBg8a2ARgDPCVk1Y4wYGOY.jpg')),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: apptheme.spaces.space_200,
                  vertical: apptheme.spaces.space_700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ref.watch(loginOtpVerificationProvider).txtHeading,
                    style: apptheme.typography.h2SemiBold,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: apptheme.spaces.space_100),
                    child: Text(
                      ref.watch(loginOtpVerificationProvider).txtSubHeading,
                      style: apptheme.typography.body,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: apptheme.spaces.space_300),
                    child: OTPTextField(
                      length: 6,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 50,
                      style: const TextStyle(fontSize: 20),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      onCompleted: (pin) {
                        // log(pin);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Expanded(
                        child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child:
                          ElevatedButton(onPressed: () {}, child: Text('data')),
                    )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
