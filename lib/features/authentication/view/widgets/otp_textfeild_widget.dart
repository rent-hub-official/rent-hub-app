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
  final void Function(String value) onChanged;
  final List<bool> isFilled;
  final void Function(String)? onCompleted;

  const OtpTextFeildWidget({
    super.key,
    required this.onCompleted,
    required this.onChanged,
    required this.isFilled,
    required this.length,
    this.width,
    required this.fieldWidth,
    required this.style,
    this.textFieldAlignment,
    this.fieldStyle,
  });

  @override
  Widget build(BuildContext context) {
    return OTPTextField(
      length: length,
      width: width!,
      fieldWidth: fieldWidth,
      style: style,
      textFieldAlignment: textFieldAlignment!,
      fieldStyle: fieldStyle!,
      onCompleted: onCompleted,
      otpFieldStyle: OtpFieldStyle(
        enabledBorderColor: AppColorPalettes.silver300,
        borderColor: Colors.black,
        focusBorderColor: Colors.black,
      ),
      //must move to domain
      onChanged: (String value) {
        for (int i = 0; i < 6; i++) {
          if (value.length > i) {
            isFilled[i] = true;
          } else {
            isFilled[i] = false;
          }
        }
        onChanged(value);
      },
    );
  }
}
