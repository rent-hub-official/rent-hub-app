import 'package:flutter/material.dart';

enum BottomNavBarItem {
  home(selectedIcon: Icons.home, unSelectedIcon: Icons.home_outlined),
  chat(selectedIcon: Icons.chat, unSelectedIcon: Icons.chat_outlined),
  favorite(
      selectedIcon: Icons.favorite, unSelectedIcon: Icons.favorite_outline),
  profile(selectedIcon: Icons.person, unSelectedIcon: Icons.person_outline);

  final IconData selectedIcon;
  final IconData unSelectedIcon;

  const BottomNavBarItem({
    required this.selectedIcon,
    required this.unSelectedIcon,
  });
}
