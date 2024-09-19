import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

class ProfieWidget extends StatelessWidget {
  const ProfieWidget({
    required this.userimg,
    super.key,
  });

  final String userimg;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.sizeOf(context).height * 0.30,
      left: 0,
      right: 0,
      child: CircleAvatar(
        radius: context.spaces.space_800,
        backgroundImage: NetworkImage(userimg),
      ),
    );
  }
}
