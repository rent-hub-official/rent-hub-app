import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class SearchFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon;

  const SearchFieldWidget({
    super.key,
    this.hintText,
    this.controller,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: "Search",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          contentPadding: EdgeInsets.all(context.spaces.space_100),
          prefixIcon: const Icon(Icons.search)),
    );
  }
}
