import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

class ChooseLocationFieldWidget extends StatelessWidget {
  const ChooseLocationFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onChanged,
  });
  final String hintText;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.place_outlined,
          size: context.spaces.space_250,
        ),
        hintText: hintText,
        hintStyle: context.typography.body,
        contentPadding:
            EdgeInsets.symmetric(vertical: context.spaces.space_200),
        errorBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: context.colors.border),
          borderRadius: BorderRadius.circular(context.spaces.space_200),
        ),
      ),
    );
  }
}
