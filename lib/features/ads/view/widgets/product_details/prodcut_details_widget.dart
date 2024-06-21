// Widget to display the product details

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/ads/product_screen.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/features/ads/view/widgets/product_details/chat_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/product_details/phone_widget.dart';

class ProductDetailsWidget extends HookConsumerWidget {
  const ProductDetailsWidget({
    super.key,
    required this.userimage,
    required this.onwername,
    required this.price,
    required this.productname,
    required this.location,
    required this.locationicon,
    required this.chaticon,
    required this.phoneicon,
    required this.productdetails,
    required this.phoneonPressed,
  });
  // Properties for product details
  final String userimage;
  final String onwername;
  final String productname;
  final String location;
  final String productdetails;
  final double price;
  final IconData locationicon;
  final IconData chaticon;
  final IconData phoneicon;
  final void Function() phoneonPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(productScreenConstantsProvider);

    // desc text line height ctrl
    final readMoreText = useState<bool>(false);

    return Center(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: context.spaces.space_300 * 8.2),
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
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
                  children: [
                    // ListTile to display product name, location and price
                    ListTile(
                      title: Text(
                        productname,
                        style: context.typography.h2SemiBold,
                      ),
                      subtitle: Row(
                        children: [
                          Icon(locationicon),
                          SizedBox(
                              width: context.spaces
                                  .space_50), // Add space between icon and text
                          Text(
                            location,
                            style: context.typography.body,
                          ),
                        ],
                      ),
                      trailing: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "$price ",
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
                      leading: Container(
                        width: context.spaces.space_300 * 2,
                        height: context.spaces.space_300 * 2,
                        decoration: BoxDecoration(
                          image:
                              DecorationImage(image: NetworkImage(userimage)),
                          borderRadius:
                              BorderRadius.circular(context.spaces.space_600),
                        ),
                      ),
                      title: Text(
                        onwername,
                        style: context.typography.bodyLargeSemiBold,
                      ),
                      subtitle: const Row(children: [
                        //Todo Rating
                      ]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Chat icon

                          ChatWidget(
                            chaticon: chaticon,
                            chatonPressed: () {},
                          ),
                          // Phone icon
                          PhoneWidget(
                              phoneicon: phoneicon, phoneonPressed: () {}),
                        ],
                      ),
                    ),
                    const Divider(),
                    // Description text with read more functionality
                    Text(
                      ref.watch(productScreenConstantsProvider).txtDescription,
                      style: context.typography.bodyLargeSemiBold,
                    ),
                    Text(
                      productdetails,
                      style: context.typography.body,
                      maxLines: readMoreText.value ? null : 6,
                      overflow: readMoreText.value
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                    ),
                    TextButton(
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
                    ),
                    // Placeholder for map
                    Padding(
                      padding: EdgeInsets.only(top: context.spaces.space_200),
                      child: Container(
                        width: double.infinity,
                        height: context.spaces.space_300 * 7.9,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          //ToDO: MAP placeholder
                          borderRadius: BorderRadius.all(
                            Radius.circular(context.spaces.space_200),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
