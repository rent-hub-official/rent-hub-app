import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:rent_hub/core/theme/color_palette.dart';

class OtpTextFeildWidget extends StatelessWidget {
  final int length;
  final double? width;
  final double fieldWidth;
  final TextStyle style;
  final MainAxisAlignment? textFieldAlignment;
  final FieldStyle? fieldStyle;
  const OtpTextFeildWidget({
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

      onCompleted: (pin) {
        // log(pin);
      },
      otpFieldStyle: OtpFieldStyle(
        enabledBorderColor: AppColorPalettes.silver300,
        borderColor: Colors.black,
        focusBorderColor: Colors.black,
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
