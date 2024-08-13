import 'package:flutter/material.dart';
import 'package:rent_hub/core/constants/ads/add_product.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/theme/color_palette.dart';

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
        fillColor: AppColorPalettes.silver300,
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: context.colors.border,
        )),
        labelText: constants.txtDescription,
        hintText: constants.txtDescriptionProduct,
      ),
      maxLines: 4,
    );
  }
}
