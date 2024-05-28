import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class SellerDetailsWidget extends ConsumerWidget {
  const SellerDetailsWidget({
    super.key,
    required this.sellerlocation,
    required this.sellername,
    required this.usertype,
    required this.userimg,
  });
  final String sellername;
  final String sellerlocation;
  final String usertype;
  final String userimg;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
          left: context.spaces.space_125 * 3, bottom: context.spaces.space_200),
      child: Row(
        children: [
          CircleAvatar(
            radius: context.spaces.space_700,
            // backgroundColor: Colors.white,
            backgroundImage: NetworkImage(userimg),
            child: Icon(
              Icons.person,
              size: 40,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: context.spaces.space_125 * 2),
            child: Column(
              children: [
                Text(sellername, style: context.typography.h2SemiBold),
                Text(usertype,
                    textAlign: TextAlign.center,
                    style: context.typography.bodySmall),
                Text(
                  sellerlocation,
                  textAlign: TextAlign.center,
                  style: context.typography.bodySmall,
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
