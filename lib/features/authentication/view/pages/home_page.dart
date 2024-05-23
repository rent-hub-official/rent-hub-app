import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/home_screen_constants/home_screen.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/widgets/product_card_widget.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/authentication/view/widgets/tabbar_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          // todo refresh indicator logic
          return null;
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              backgroundColor: context.colors.appBarBackground,
              pinned: false,
              title: Row(
                children: [
                  const Icon(Icons.place_outlined),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.spaces.space_100),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'kozhikodu,hilite',
                          style: context.typography.bodySemibold,
                        ),
                        Text(
                          'kerala,india',
                          style: context.typography.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: context.spaces.space_100),
                    child: AppIconButton(
                      onTap: () {
                        // todo
                      },
                      icon: Icons.search,
                    ),
                  ),
                  AppIconButton(
                    onTap: () {
                      // todo
                    },
                    icon: Icons.notifications,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TabbarWidget(
                    onTap: () {},
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: context.spaces.space_200,
                        right: context.spaces.space_200,
                        top: context.spaces.space_200,
                        bottom: context.spaces.space_200),
                    child: Text(
                      ref.watch(homeScreenProvider).txtsub,
                      style: context.typography.bodySemibold,
                    ),
                  ),
                ],
              ),
            ),
            SliverList.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: context.spaces.space_200,
                );
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.spaces.space_200),
                  child: ProductCardWidget(
                      productName: 'Beleno',
                      price: 3000,
                      productLocation: 'kasargod',
                      distance: 222,
                      img:
                          'https://imgd.aeplcdn.com/664x374/n/cw/ec/102663/baleno-exterior-right-front-three-quarter-66.jpeg?isig=0&q=80',
                      onTap: () {},
                      belowbtn: ref.watch(homeScreenProvider).txtBtn),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
