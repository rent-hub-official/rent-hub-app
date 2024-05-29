import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String name;
  final String phone;
  final Widget child;
  const ProfileHeaderWidget({
    super.key,
    required this.name,
    required this.phone,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.spaces.space_900 * 4.5,
      child: Stack(
        children: [
          Container(
            height: context.spaces.space_800 * 4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.colors.primary,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(context.spaces.space_900 * 2),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: context.spaces.space_700),
              child: Container(
                height: context.spaces.space_700 * 4,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.colors.bottomNavBorder,
                  borderRadius: BorderRadius.circular(context.spaces.space_400),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(name, style: context.typography.h2Bold),
                    SizedBox(height: context.spaces.space_100,),
                    Text(
                      phone,
                      style: context.typography.h3Bold,
                    ),
                    SizedBox(height: context.spaces.space_500,)
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
                backgroundColor: context.colors.cardBackground,
                radius: context.spaces.space_400 * 3,
                child: child),
          ),
        ],
      ),
    );
  }
}
