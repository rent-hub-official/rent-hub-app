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
  const TextFeildWidget({
    super.key,
    this.labeltxt,
    this.hinttxt,
    required this.textController,
    this.suffixicon,
    this.prefixicon,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textController,
      decoration: InputDecoration(
        prefixIcon: prefixicon,
        labelText: labeltxt,
        labelStyle: context.typography.body,
        hintText: hinttxt,
        hintStyle: context.typography.body,
        suffixIcon: suffixicon,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColorPalettes.red500),
        ),
      ),
    );
  }
}
