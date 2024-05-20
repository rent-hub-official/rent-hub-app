import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class TextFeildWidget extends StatelessWidget {
  final String labeltxt;
  final String hinttxt;
  final IconData? suffixicon;
  final IconData? prefixicon;
  final TextEditingController textController;
  final Function() onTap;
  const TextFeildWidget({
    super.key,
    required this.labeltxt,
    required this.hinttxt,
    required this.onTap,
    required this.textController,
    this.suffixicon,
    this.prefixicon,
  });

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final space = AppTheme.of(context).spaces;
    return Padding(
      padding: EdgeInsets.all(space.space_200),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          prefixIcon: Icon(prefixicon),
          labelText: labeltxt,
          hintText: hinttxt,
          suffixIcon: IconButton(
            icon: Icon(suffixicon),
            onPressed: onTap,
          ),
        ),
      ),
    );
  }
}
