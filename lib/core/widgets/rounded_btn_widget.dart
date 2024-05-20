import 'package:flutter/material.dart';

class RoundedbtnWidget extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final Color? backgroundclr;
  final double? radius;
  const RoundedbtnWidget({
    super.key,
    required this.onTap,
    required this.icon,
    required this.backgroundclr,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundclr,
      child: IconButton(onPressed: onTap, icon: Icon(icon)),
    );
  }
}
