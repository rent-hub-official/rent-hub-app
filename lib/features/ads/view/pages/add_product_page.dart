import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_hub/core/constants/add_product_constants/add_product.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/core/widgets/textfeild_widget.dart';
import 'package:rent_hub/features/ads/controller/category_controller/category_provider.dart';
import 'package:rent_hub/features/ads/controller/product_controller/product_controller.dart';
import 'package:rent_hub/features/ads/domain/model/ads_model.dart';
import 'package:rent_hub/features/ads/view/pages/my_products_page.dart';
import 'package:rent_hub/features/ads/view/widgets/add_product_page/description_feild_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/add_product_page/image_picker_widget.dart';

class AddProductPage extends HookConsumerWidget {
  static const routePath = '/addProduct';
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ImagePicker imagePicker = ImagePicker();
    final constants = ref.watch(addProductConstantsProvider);
    final productNamecontroller = useTextEditingController();
    final priceController = useTextEditingController();
    final locationController = useTextEditingController();
    final descriptionController = useTextEditingController();

    final categoryindexSelector = useState<int?>(null);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(context.spaces.space_50),
          child: RoundedIconButton(
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
      body: ref.watch(getCategorysProvider).when(
            data: (data) {
              // categories
              final categoryList = data.docs
                  .map(
                    (e) => e.data()['name'],
                  )
                  .toList();

              return SingleChildScrollView(
                child: Padding(
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
                      // ads images
                      SizedBox(
                        height: context.spaces.space_900,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Imagewidget(
                                imagePath: ref.watch(ImageListProvider)[index],
                              ),
                              separatorBuilder: (context, index) => SizedBox(
                                width: context.spaces.space_100,
                              ),
                              itemCount: ref.watch(ImageListProvider).length,
                            ),
                            Imagewidget(
                              onTap: () async {
                                final XFile? img = await imagePicker.pickImage(
                                  source: ImageSource.gallery,
                                );
                                // add image firebase
                                if (img != null)
                                  ref
                                      .read(addProductsProvider.notifier)
                                      .addImage(
                                        context,
                                        image: File(img.path),
                                        userId: 'userId',
                                      );
                              },
                            ),
                          ],
                        ),
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
                        height: context.spaces.space_400,
                      ),
                      // category drop down
                      DropdownButton<int>(
                        isExpanded: true,
                        value: categoryindexSelector.value,
                        disabledHint: Text('data'),
                        hint: Padding(
                          padding: EdgeInsets.only(
                            bottom: context.spaces.space_400,
                          ),
                          child: Text(
                            constants.txtSelectCategory,
                            style: context.typography.body,
                          ),
                        ),
                        underline: Divider(
                          height: context.spaces.space_200,
                          color: context.colors.border,
                        ),
                        items: [
                          for (int i = 0; i < categoryList.length; i++)
                            DropdownMenuItem(
                              value: i,
                              child: Text(categoryList[i]),
                            ),
                        ],
                        onChanged: (value) {
                          categoryindexSelector.value = value;
                        },
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
                      DescriptionFeildWidget(
                        descriptionController: descriptionController,
                        constants: constants,
                      ),
                      SizedBox(
                        height: context.spaces.space_600,
                      ),
                      MainBtnWidget(
                        onTap: () {
                          // add products data
                          ref.read(addProductsProvider.notifier).addProduct(
                                context,
                                data: AdsModel(
                                  views: 0,
                                  imagePath: ref.read(ImageListProvider),
                                  productName: productNamecontroller.text,
                                  category: data
                                      .docs[categoryindexSelector.value ?? 0]
                                      .id,
                                  locationTitle: locationController.text,
                                  lat: 0,
                                  long: 0,
                                  // TODO :change this field user id
                                  userId: 'userId',
                                  description: descriptionController.text,
                                  price: double.parse(priceController.text),
                                ),
                              );

                          Navigator.pop(context);
                        },
                        btnTxt: constants.txtBtn,
                      )
                    ],
                  ),
                ),
              );
            },
            error: (error, stackTrace) => Column(
              children: [],
            ),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
