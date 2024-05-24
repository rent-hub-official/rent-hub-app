
import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.chaticon,
    required this.chatonPressed,
  });

  final IconData chaticon;
  final void Function() chatonPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.spaces.space_500,
      height: context.spaces.space_500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.spaces.space_500),
        color: context.colors.secondary,
      ),
      child: Center(
        child: IconButton(
          icon: Icon(chaticon),
          onPressed: chatonPressed,
        ),
      ),
    );
  }
}
