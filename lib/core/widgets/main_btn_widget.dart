import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class MainBtnWidget extends StatelessWidget {
  final Function() onTap;
  final String btnTxt;
  final bool isLoading;

  const MainBtnWidget({
    super.key,
    required this.onTap,
    required this.btnTxt,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? AnimatedContainer(
            width: context.spaces.space_900,
            height: context.spaces.space_600,
            padding: EdgeInsets.symmetric(
              horizontal: context.spaces.space_300,
              vertical: context.spaces.space_150,
            ),
            decoration: BoxDecoration(
              color: context.colors.primary,
              borderRadius: BorderRadius.circular(
                context.spaces.space_600,
              ),
            ),
            curve: Curves.bounceIn,
            duration: const Duration(seconds: 3),
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: context.colors.btnText,
            ),
          )
        : SizedBox(
            width: double.infinity,
            height: context.spaces.space_600,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.white,
                backgroundColor: context.colors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    context.spaces.space_100,
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: context.spaces.space_200,
                  vertical: context.spaces.space_100,
                ),
              ),
              child: Text(
                btnTxt,
                style: context.typography.buttonText,
              ),
            ),
          );
  }
}
