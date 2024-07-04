// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:rent_hub/core/theme/app_theme.dart';

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
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        contentPadding: EdgeInsets.all(context.spaces.space_100),
        prefixIcon: prefixIcon,
      ),
    );
  }
}
