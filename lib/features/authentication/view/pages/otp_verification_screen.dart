import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:rent_hub/core/constants/image_constants.dart';
import 'package:rent_hub/core/constants/login_page_constants/login_otp_verification.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/features/authentication/view/widgets/otp_textfeild_widget.dart';

class OtpVerificationScreen extends ConsumerWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<bool> isFilled = List.filled(6, false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ref.watch(imageConstantsProvider).imgOtpGirl),
            // const Image(
            //   image: NetworkImage(
            //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXhh_oimifmtuuW45lHVeDk6S1sXjJ4cCyi-EI9lrfgw&s',
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.spaces.space_200,
                  vertical: context.spaces.space_200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ref.watch(loginOtpVerificationProvider).txtHeading,
                    style: context.typography.h2SemiBold,
                  ),
                  SizedBox(height: context.spaces.space_100),
                  Text(
                    ref.watch(loginOtpVerificationProvider).txtSubHeading,
                    style: context.typography.body,
                  ),
                  SizedBox(height: context.spaces.space_250),
                  // OtptextFeildWidget(isFilled: isFilled),
                  OtpTextFeildWidget(
                    isFilled: isFilled,
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: context.spaces.space_125 * 5.5,
                    style: context.typography.bodyLarge,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                  )
                ],
              ),
            ),
            MainBtnWidget(
              onTap: () {},
              btnTxt: ref.watch(loginOtpVerificationProvider).verifyOtpBtn,
            ),
          ],
        ),
      ),
    );
  }
}
