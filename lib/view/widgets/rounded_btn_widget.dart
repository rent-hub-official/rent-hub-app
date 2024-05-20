import 'package:flutter/material.dart';

class RoundedbtnWidget extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final Color backgroundclr;
  const RoundedbtnWidget({
    super.key,
    required this.onTap,
    required this.icon,
    required this.backgroundclr,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: backgroundclr,
      child: IconButton(onPressed: onTap, icon: Icon(icon)),
    );
  }
}
