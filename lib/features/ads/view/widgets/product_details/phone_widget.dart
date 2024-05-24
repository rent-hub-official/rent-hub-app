import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class PhoneWidget extends StatelessWidget {
  const PhoneWidget({
    super.key,
    required this.phoneicon,
    required this.phoneonPressed,
  });

  final IconData phoneicon;
  final void Function() phoneonPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.spaces.space_200),
      child: Container(
        width: context.spaces.space_500,
        height: context.spaces.space_500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.spaces.space_500),
          color: context.colors.secondary,
        ),
        child: Center(
          child: IconButton(
            icon: Icon(phoneicon),
            onPressed: phoneonPressed,
          ),
        ),
      ),
    );
  }
}