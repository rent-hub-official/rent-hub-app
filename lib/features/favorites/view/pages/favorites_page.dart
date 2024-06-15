import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/favourites/favourites.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/product_card_widget.dart';
import 'package:rent_hub/features/favorites/view/widgets/no_favorites_widget.dart';

final List<dynamic> favoritesList = [
  [
    'BMW 5 series',
    1500.00,
    'Kozhikode, kerala',
    10.00,
    'https://www.topgear.com/sites/default/files/2022/09/1-BMW-3-Series.jpg',
  ],
  [
    'BMW 5 series',
    1500.00,
    'Kozhikode, kerala',
    10.00,
    'https://www.topgear.com/sites/default/files/2022/09/1-BMW-3-Series.jpg',
  ],
  [
    'BMW 5 series',
    1500.00,
    'Kozhikode, kerala',
    10.00,
    'https://www.topgear.com/sites/default/files/2022/09/1-BMW-3-Series.jpg',
  ],
  [
    'BMW 5 series',
    1500.00,
    'Kozhikode, kerala',
    10.00,
    'https://www.topgear.com/sites/default/files/2022/09/1-BMW-3-Series.jpg',
  ]
];

class FavoritesPage extends ConsumerWidget {
  const FavoritesPage({super.key});
  static final routePath = '/favoritespage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(favouritesConstantsProvider).txtFavourite),
        titleTextStyle: context.typography.h2Bold,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: context.spaces.space_200,
          right: context.spaces.space_200,
          top: context.spaces.space_100,
        ),
        child: favoritesList.isEmpty
            ? NoFavoritesWidget()
            : ListView.separated(
                itemBuilder: (context, index) => ProductCardWidget(
                    isFavorite: true,
                    favoriteTap: () {
                      // TODO : favorites operation
                    },
                    productName: favoritesList[index][0],
                    price: favoritesList[index][1],
                    productLocation: favoritesList[index][2],
                    distance: favoritesList[index][3],
                    img: favoritesList[index][4],
                    onTap: () {
                      // TODO: rental operation
                    },
                    belowbtn: "Rent Now"),
                separatorBuilder: (context, index) => SizedBox(
                  height: context.spaces.space_200,
                ),
                itemCount: favoritesList.length,
              ),
      ),
    );
  }
}
