import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_hub/core/constants/add_product_constants/add_product.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/core/widgets/textfeild_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/add_product_page/description_feild_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/add_product_page/image_picker_widget.dart';

class AddProductPage extends ConsumerWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ImagePicker imagePicker = ImagePicker();
    final constants = ref.watch(addProductProvider);
    final productNamecontroller = TextEditingController();
    final priceController = TextEditingController();
    final categoryController = TextEditingController();
    final locationController = TextEditingController();
    final offerController = TextEditingController();
    final descriptionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(context.spaces.space_50),
          child: AppIconButton(
            onTap: () {
              context.pop();
            },
            icon: Icons.chevron_left,
          ),
        ),
        title: Text(
          constants.txtHeading,
          style: context.typography.h2SemiBold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.spaces.space_200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              constants.txtPhotos,
              style: context.typography.body,
            ),
            SizedBox(
              height: context.spaces.space_100,
            ),
            Text(constants.txtSubHeading),
            SizedBox(
              height: context.spaces.space_125,
            ),
            ImagePickerwidget(
              onTap: () async {
                final XFile? img = await imagePicker.pickImage(
                  source: ImageSource.gallery,
                );
              },
            ),
            SizedBox(
              height: context.spaces.space_100,
            ),
            TextFeildWidget(
              labeltxt: constants.txtProductName,
              hinttxt: constants.txtGiveItemName,
              textController: productNamecontroller,
              validator: (val) {
                return null;
              },
            ),
            SizedBox(
              height: context.spaces.space_100,
            ),
            TextFeildWidget(
              labeltxt: constants.txtPrice,
              hinttxt: constants.txtItemPrice,
              textController: priceController,
              validator: (val) {
                return null;
              },
            ),
            SizedBox(
              height: context.spaces.space_100,
            ),
            TextFeildWidget(
              labeltxt: constants.txtcategory,
              hinttxt: constants.txtSelectCategory,
              textController: categoryController,
              validator: (val) {
                return null;
              },
            ),
            SizedBox(
              height: context.spaces.space_100,
            ),
            TextFeildWidget(
              labeltxt: constants.txtLocation,
              hinttxt: constants.txtHintLocation,
              textController: locationController,
              validator: (val) {
                return null;
              },
            ),
            SizedBox(
              height: context.spaces.space_100,
            ),
            TextFeildWidget(
              labeltxt: constants.txtOffers,
              hinttxt: constants.txtPicOffer,
              textController: offerController,
              validator: (val) {
                return null;
              },
            ),
            SizedBox(
              height: context.spaces.space_400,
            ),
            DescriptionFeildWidget(
              descriptionController: descriptionController,
              constants: constants,
            ),
            SizedBox(
              height: context.spaces.space_600,
            ),
            MainBtnWidget(onTap: () {}, btnTxt: constants.txtBtn)
          ],
        ),
      ),
    );
  }
}
