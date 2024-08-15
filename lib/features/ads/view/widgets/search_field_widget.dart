// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:rent_hub/core/extensions/app_theme_extension.dart';

class SearchFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final void Function(String value)? onChanged;
  final void Function(String value)? onFieldSubmitted;

  const SearchFieldWidget({
    super.key,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.onChanged,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    /// Get the border for the input field with the given color
    OutlineInputBorder getSearchFieldBorder([Color? color]) =>
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: color != null ? BorderSide(color: color) : BorderSide(),
        );

    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        border: getSearchFieldBorder(context.colors.border),
        enabledBorder: getSearchFieldBorder(context.colors.border),
        focusedBorder: getSearchFieldBorder(context.colors.border),
        contentPadding: EdgeInsets.all(context.spaces.space_100),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
