import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class MainBtnWidget extends StatelessWidget {
  final Function() onTap;
  final String btnTxt;

  const MainBtnWidget({
    super.key,
    required this.onTap,
    required this.btnTxt,
  });

  @override
  Widget build(BuildContext context) {
    final apptheme = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.white,
            backgroundColor: apptheme.colors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(apptheme.spaces.space_100),
            ),
            padding: EdgeInsets.symmetric(
                horizontal: apptheme.spaces.space_200,
                vertical: apptheme.spaces.space_100),
          ),
          child: Text(
            btnTxt,
            style: apptheme.typography.buttonText,
          ),
        ),
      ),
    );
  }
}
