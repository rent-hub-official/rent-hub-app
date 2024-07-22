import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';

class TextFeildWidget extends StatelessWidget {
  final String? labeltxt;
  final String? hinttxt;
  final Icon? suffixicon;
  final Icon? prefixicon;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final bool enabled;

  const TextFeildWidget({
    super.key,
    this.suffix,
    this.labeltxt,
    this.hinttxt,
    required this.textController,
    this.suffixicon,
    this.prefixicon,
    this.onFieldSubmitted,
    this.validator,
    this.keyboardType,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return "Enter your values";
            }
            return null;
          },
      controller: textController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabled: enabled,
        prefixIcon: prefixicon,
        labelText: labeltxt,
        labelStyle: context.typography.body,
        hintText: hinttxt,
        hintStyle: context.typography.body,
        suffixIcon: suffixicon,
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
