import 'package:flutter/material.dart';
import 'package:rent_hub/core/constants/ads/add_product.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

class DescriptionFeildWidget extends StatelessWidget {
  const DescriptionFeildWidget({
    super.key,
    required this.descriptionController,
    required this.constants,
  });

  final TextEditingController descriptionController;
  final AddProductConstants constants;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: descriptionController,
      decoration: InputDecoration(
        fillColor: context.colors.cardBackground,
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: context.colors.border,
        )),
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: context.colors.border,
        )),
        labelText: constants.txtDescription,
        labelStyle: TextStyle(
          color: context.colors.border,
        ),
        hintText: constants.txtDescriptionProduct,
        hintStyle: TextStyle(
          color: context.colors.border,
        ),
      ),
      maxLines: 4,
    );
  }
}
