import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/product_card_widget.dart';

class CategoryListBuilderWidget extends StatelessWidget {
  const CategoryListBuilderWidget({
    super.key,
    required this.poductsList,
    required this.onTap,
  });

  final List poductsList;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero, // Remove top padding

      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.spaces.space_200,
            vertical: context.spaces.space_100, // Add vertical padding
          ),
          child: ProductCardWidget(
            productName: poductsList[index][0],
            price: poductsList[index][1],
            productLocation: poductsList[index][2],
            distance: poductsList[index][3],
            img: poductsList[index][4],
            onTap: onTap,
            belowbtn: 'rent Now',
          ),
        );
      },
      itemCount: poductsList.length,
    );
  }
}
