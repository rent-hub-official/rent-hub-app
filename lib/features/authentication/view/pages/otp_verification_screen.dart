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
                  OtptextFeildWidget(
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

class OtptextFeildWidget extends StatelessWidget {
  final int length;
  final double? width;
  final double fieldWidth;
  final TextStyle style;
  final MainAxisAlignment? textFieldAlignment;
  final FieldStyle? fieldStyle;
  const OtptextFeildWidget({
    super.key,
    required this.isFilled,
    required this.length,
    this.width,
    required this.fieldWidth,
    required this.style,
    this.textFieldAlignment,
    this.fieldStyle,
  });

  final List<bool> isFilled;

  @override
  Widget build(BuildContext context) {
    return OTPTextField(
      length: length,
      width: width!,
      fieldWidth: fieldWidth,
      style: style,
      textFieldAlignment: textFieldAlignment!,
      fieldStyle: fieldStyle!,
      // length: 6,
      // width: MediaQuery.of(context).size.width,
      // fieldWidth: context.spaces.space_125 * 5.5,
      // style: context.typography.bodyLarge,
      // textFieldAlignment: MainAxisAlignment.spaceAround,
      // fieldStyle: FieldStyle.box,

      onCompleted: (pin) {
        // log(pin);
      },
      otpFieldStyle: OtpFieldStyle(
        enabledBorderColor: AppColorPalettes.silver300,
        borderColor: Colors.black,

        focusBorderColor: Colors.black, // Color for filled fields
      ),
      // ! must move to domain
      onChanged: (String value) {
        for (int i = 0; i < 6; i++) {
          if (value.length > i) {
            isFilled[i] = true;
          } else {
            isFilled[i] = false;
          }
        }
      },
    );
  }
}
