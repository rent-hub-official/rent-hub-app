import 'package:flutter/material.dart';

/// This enum is used to represent the items avaliable in the bottom navigation bar.
///
/// Each bottom nav bar item will have a selected icon and an unselected icon.
enum BottomNavBarItem {
  home(selectedIcon: Icons.home, unSelectedIcon: Icons.home_outlined),
  chat(selectedIcon: Icons.chat, unSelectedIcon: Icons.chat_outlined),
  favorite(
      selectedIcon: Icons.favorite, unSelectedIcon: Icons.favorite_outline),
  profile(selectedIcon: Icons.person, unSelectedIcon: Icons.person_outline);

  /// The selected and unselected icon's path in the assets folder.
  final IconData selectedIcon;
  final IconData unSelectedIcon;

  const BottomNavBarItem({
    required this.selectedIcon,
    required this.unSelectedIcon,
  });
}
