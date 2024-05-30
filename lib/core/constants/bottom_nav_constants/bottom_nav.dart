import 'package:flutter/material.dart';
import 'package:rent_hub/features/authentication/view/pages/home_page.dart';
import 'package:rent_hub/features/authentication/view/pages/profile_page.dart';
import 'package:rent_hub/features/chat/view/pages/chat_details_page.dart';
import 'package:rent_hub/features/favorites/view/pages/favorites_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_nav.g.dart';

class BottomNavConstants {
  final List<Icon> selectedIcons = [
    getIcon(Icons.home),
    getIcon(Icons.chat),
    getIcon(Icons.favorite),
    getIcon(Icons.person),
  ];
  final List<Icon> unSelectedIcons = [
    getIcon(Icons.home_outlined),
    getIcon(Icons.chat_outlined),
    getIcon(Icons.favorite_outline),
    getIcon(Icons.person_outline),
  ];
  final List<Widget> pages = [
    HomePage(),
    ChatDetailsPage(),
    FavoritesPage(),
    ProfilePage()
  ];
}

Icon getIcon(IconData data) => Icon(
      data,
      size: 28,
      weight: .3,
    );

@riverpod
BottomNavConstants bottomNavConstants(BottomNavConstantsRef ref) {
  return BottomNavConstants();
}
