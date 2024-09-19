import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:shimmer/shimmer.dart';

class ChatListLoadingWidget extends StatelessWidget {
  const ChatListLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 10, // Number of shimmer placeholders
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: context.spaces.space_100,
                horizontal: context.spaces.space_200),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
              ),
              title: Container(
                width: 100,
                height: 20,
                color: Colors.white,
              ),
              subtitle: Container(
                width: context.spaces.space_400,
                height: context.spaces.space_25,
                color: Colors.white,
              ),
            ),
            // child: Container(
            //   width: double.infinity,
            //   height: context.spaces.space_400,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(12.0),
            //   ),
          );
        },
      ),
    );
  }
}
