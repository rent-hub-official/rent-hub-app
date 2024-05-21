import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class TextFeildWidget extends StatelessWidget {
  final String labeltxt;
  final String hinttxt;
  final Icon? suffixicon;
  final Icon? prefixicon;
  final TextEditingController textController;
  final String? Function(String?)? validator;
  const TextFeildWidget({
    super.key,
    required this.labeltxt,
    required this.hinttxt,
    required this.textController,
    this.suffixicon,
    this.prefixicon,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final space = AppTheme.of(context).spaces;
    final apptheme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.all(space.space_200),
      child: TextFormField(
        validator: validator,
        controller: textController,
        decoration: InputDecoration(
          prefixIcon: prefixicon,
          labelText: labeltxt,
          labelStyle: apptheme.typography.body,
          hintText: hinttxt,
          hintStyle: apptheme.typography.body,
          suffixIcon: suffixicon,
          errorBorder: OutlineInputBorder(
              // borderSide: BorderSide(color: colorpa),
              ),
        ),
      ),
    );
  }
}
