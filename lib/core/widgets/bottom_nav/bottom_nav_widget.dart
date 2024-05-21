import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/bottom_nav_constants/bottom_nav.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/bottom_nav/animated_bottom_nav/animated_bottom_nav_bar.dart';

class BottomNavWidget extends ConsumerWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = PageController();
    // custom  colors
    final appColor = AppTheme.of(context).colors;
    // custom sizes
    final appSpaces = AppTheme.of(context).spaces;
    //page index controller
    final activePageIndex = ref.watch(bottomPageIndexProvider);
    //icon provider
    final bottomNavConstProvider = ref.read(bottomNavProvider);

    final List<Icon> selectedIcons = bottomNavConstProvider.selectedIcons;
    final List<Icon> unSelectedIcons = bottomNavConstProvider.unSelectedIcons;

    final List<Widget> pages = bottomNavConstProvider.pages;

    // Function to handle page changes in a PageView
    void handlePageChange(int value) {
      pageController.animateToPage(
        value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }

    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: appSpaces.space_50),
        child: FloatingActionButton(
          onPressed: () {
            //add product
          },
          backgroundColor: appColor.primary,
          child: bottomNavConstProvider.floatingActionBtnIcon,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: appSpaces.space_800,
        onTap: (int index) {
          ref.watch(bottomPageIndexProvider.notifier).state = index;
          handlePageChange(index);
        },
        borderColor: appColor.bottomNavBorder,
        borderWidth: .5,
        activeIndex: activePageIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        notchMargin: appSpaces.space_150,
        scaleFactor: 0,
        icons: [
          for (int i = 0; i < pages.length; i++)
            i == activePageIndex ? selectedIcons[i] : unSelectedIcons[i]
        ],
      ),
    );
  }
}

final StateProvider<int> bottomPageIndexProvider = StateProvider(
  (ref) => 0,
);
