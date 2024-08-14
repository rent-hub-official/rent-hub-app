import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/theme/color_palette.dart';

class TextFieldWidget extends StatelessWidget {
  final String? label;
  final String? hintText;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final bool isEnabled;

  const TextFieldWidget.TextFielddWidget({
    super.key,
    required this.textController,
    this.suffix,
    this.label,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.validator,
    this.keyboardType,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return "This field is required";
            }
            return null;
          },
      controller: textController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabled: isEnabled,
        prefixIcon: prefixIcon,
        labelText: label,
        labelStyle: context.typography.body,
        hintText: hintText,
        hintStyle: context.typography.body,
        suffixIcon: suffixIcon,
        suffix: suffix,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColorPalettes.red500),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: context.colors.border),
        ),
      ),
    );
  }
}
