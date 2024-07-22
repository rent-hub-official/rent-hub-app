import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/ads/product_screen.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model/ads_model.dart';
import 'package:rent_hub/features/ads/view/widgets/product_details/map_widget.dart';

class ProductDetailsWidget extends HookConsumerWidget {
  const ProductDetailsWidget({
    super.key,
    required this.adsModel,
    required this.userimage,
    required this.sellerName,
    required this.chatTap,
    required this.callTap,
    required this.onTap,
  });

  final AdsModel adsModel;
  final String? userimage;
  final String sellerName;

  final void Function() callTap;
  final void Function() chatTap;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(productScreenConstantsProvider);

    // desc text line height ctrl
    final readMoreText = useState<bool>(false);

    final description = adsModel.description ?? "";

    return Container(
      decoration: BoxDecoration(
        color: context.colors.cardBackground,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(context.spaces.space_300),
          topRight: Radius.circular(context.spaces.space_300),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: context.spaces.space_200,
          left: context.spaces.space_200,
          right: context.spaces.space_200,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // ListTile to display product name, location and price
            ListTile(
              title: Text(
                adsModel.productName,
                style: context.typography.h2SemiBold,
              ),
              subtitle: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: context.colors.iconButtonIcon,
                  ),
                  SizedBox(
                    width: context.spaces.space_50,
                  ), // Add space between icon and text
                  Flexible(
                    flex: 1,
                    child: Text(
                      adsModel.locationTitle,
                      style: context.typography.body,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              trailing: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${adsModel.price} ",
                      style: context.typography.h2Bold,
                    ),
                    TextSpan(
                      text: constants.txtPerday,
                      style: context.typography.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            // ListTile to display owner details
            ListTile(
              leading: InkWell(
                onTap: onTap,
                child: CircleAvatar(
                  radius: context.spaces.space_300,
                  backgroundImage: userimage != null
                      ? NetworkImage(
                          userimage!,
                        )
                      : null,
                  child: userimage == null ? Icon(Icons.person) : null,
                ),
              ),
              title: Text(
                sellerName,
                style: context.typography.bodyLargeSemiBold,
              ),
              titleAlignment: ListTileTitleAlignment.top,
              subtitle: const Row(
                children: [
                  //Todo Rating
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // icon btn for message
                  RoundedIconButton(
                    onTap: chatTap,
                    icon: Icons.message,
                    backgroundColor: context.colors.secondary,
                    iconColor: AppColorPalettes.white500,
                  ),
                  // width spacing
                  SizedBox(
                    width: context.spaces.space_200,
                  ),
                  // icon btn for call
                  RoundedIconButton(
                    onTap: callTap,
                    icon: Icons.call,
                    backgroundColor: context.colors.secondary,
                    iconColor: AppColorPalettes.white500,
                  )
                ],
              ),
            ),
            const Divider(),
            // Description text with read more functionality
            description.isEmpty
                ? SizedBox.shrink()
                : Text(
                    ref.watch(productScreenConstantsProvider).txtDescription,
                    style: context.typography.bodyLargeSemiBold,
                  ),
            Text(
              description,
              style: context.typography.body,
              maxLines: readMoreText.value ? null : 4,
              overflow: readMoreText.value
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
            ),
            description.length > 200
                ? TextButton(
                    onPressed: () {
                      // toggle desc text more and less
                      readMoreText.value = !readMoreText.value;
                    },
                    child: Text(
                      readMoreText.value
                          ? constants.readlesstext
                          : constants.readmoretext,
                      style: const TextStyle(color: AppColorPalettes.blue),
                    ),
                  )
                : SizedBox.shrink(),
            // Placeholder for map
            MapWidget(
              latLng: LatLng(adsModel.lat, adsModel.long),
            ),
          ],
        ),
      ),
    );
  }
}
