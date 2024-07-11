import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class SellerDetailsWidget extends ConsumerWidget {
  const SellerDetailsWidget({
    super.key,
    required this.sellerLocation,
    required this.sellerName,
    required this.userImg,
  });
  final String sellerName;
  final String sellerLocation;
  final String userImg;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
          left: context.spaces.space_125 * 3, bottom: context.spaces.space_200),
      child: Row(
        children: [
          CircleAvatar(
            radius: context.spaces.space_700,
            backgroundImage: NetworkImage(
              userImg,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: context.spaces.space_125 * 2),
            child: Column(
              children: [
                Text(sellerName, style: context.typography.h1SemiBold),

                Text(
                  sellerLocation,
                  textAlign: TextAlign.center,
                  style: context.typography.h3SemiBold,
                ),
                //TODO: Rating
              ],
            ),
          ),
        ],
      ),
    );
  }
}
