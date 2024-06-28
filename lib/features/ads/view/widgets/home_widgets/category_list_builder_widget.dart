import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/animation_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/product_card_widget.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model.dart';
import 'package:lottie/lottie.dart';
import 'package:rent_hub/features/ads/view/pages/product_details_page/product_details_page.dart';

class CategoryListBuilderWidget extends ConsumerWidget {
  const CategoryListBuilderWidget({
    super.key,
    required this.poductsList,
  });
// get available data of products
  final List<AdsModel> poductsList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lottieConsts = ref.read(animationConstantsProvider);
    return poductsList.isNotEmpty
        ? ListView.builder(
            itemCount: poductsList.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.spaces.space_200,
                  vertical: context.spaces.space_100,
                ),
                // product card
                child: ProductCardWidget(
                  productName: poductsList[index].productName,
                  price: poductsList[index].price,
                  productLocation: poductsList[index].locationTitle,
                  distance: poductsList[index].long,
                  img: poductsList[index].imagePath[0],
                  onTap: () {
                    context.push(
                      ProductDetailsPage.routePath,
                    );
                    // TODO : check it
                  },
                  belowbtn: 'rent Now',
                ),
              );
            },
          )
        : LayoutBuilder(
            builder: (context, constraints) {
              return Center(
                child: Lottie.asset(
                  lottieConsts.animationEmpty,
                  height: constraints.maxHeight * .4,
                ),
              );
            },
          );
  }
}
