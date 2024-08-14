import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rent_hub/core/enums/bottom_nav_items_enum.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/widgets/bottom_nav_bar/animated_bottom_nav_bar.dart';
import 'package:rent_hub/features/ads/view/pages/add_product_page.dart';
import 'package:rent_hub/features/ads/view/pages/home_page.dart';
import 'package:rent_hub/features/authentication/view/pages/profile_page.dart';
import 'package:rent_hub/features/chat/view/pages/chat_list_page.dart';
import 'package:rent_hub/features/favorites/view/pages/favorites_page.dart';

class NavigationPage extends ConsumerWidget {
  static const routePath = '/nav';

  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController();

    //page index controller
    final activePageIndex = ref.watch(bottomPageIndexProvider);

    // Function to handle page changes in a PageView
    void handlePageChange(int value) {
      pageController.animateToPage(
        value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }

    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          ChatListPage(),
          FavoritesPage(),
          ProfilePage(),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: context.spaces.space_50),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(context.spaces.space_900 * 2)),
          onPressed: () {
            //add product
            context.push(AddProductPage.routePath);
          },
          backgroundColor: context.colors.primary,
          child: Icon(
            Icons.add,
            color: context.colors.btnText,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: context.colors.bottomNavBar,
        height: context.spaces.space_800,
        onTap: (int index) {
          ref.watch(bottomPageIndexProvider.notifier).state = index;
          handlePageChange(index);
        },
        borderColor: context.colors.bottomNavBorder,
        borderWidth: .5,
        activeIndex: activePageIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        notchMargin: context.spaces.space_150,
        scaleFactor: 0,
        icons: [
          for (final navBarItem in BottomNavBarItem.values)
            Icon(
              navBarItem.index == activePageIndex
                  ? navBarItem.selectedIcon
                  : navBarItem.unSelectedIcon,
              weight: 0.3,
              size: 28,
            )
        ],
      ),
    );
  }
}

final StateProvider<int> bottomPageIndexProvider = StateProvider(
  (ref) => 0,
);
