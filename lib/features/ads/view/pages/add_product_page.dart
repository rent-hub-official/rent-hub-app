import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/ads/add_product.dart';
import 'package:rent_hub/core/constants/error_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/core/widgets/textfeild_widget.dart';
import 'package:rent_hub/features/ads/controller/category_controller/category_provider.dart';
import 'package:rent_hub/features/ads/controller/image_controller/image_provider.dart';
import 'package:rent_hub/features/ads/controller/product_controller/product_controller.dart';
import 'package:rent_hub/features/ads/view/widgets/add_product_page/category_drop_drown_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/add_product_page/description_feild_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/add_product_page/image_selector_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/add_product_page/location_feild_widget.dart';

class AddProductPage extends HookConsumerWidget {
  static const routePath = '/addProduct';

  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(addProductConstantsProvider);

    final productNamecontroller = useTextEditingController();
    final priceController = useTextEditingController();
    final descriptionController = useTextEditingController();

    final dropDownItem = useState<String?>(null);

    final formKey = useState(GlobalKey<FormState>());

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
      body: ref.watch(getCategoryProvider).when(
            data: (data) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(context.spaces.space_200),
                  child: Form(
                    key: formKey.value,
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
                        ImageSelectorWidget(),
                        SizedBox(
                          height: context.spaces.space_100,
                        ),
                        TextFeildWidget(
                          labeltxt: constants.txtProductName,
                          hinttxt: constants.txtGiveItemName,
                          textController: productNamecontroller,
                        ),
                        SizedBox(
                          height: context.spaces.space_100,
                        ),
                        TextFeildWidget(
                          labeltxt: constants.txtPrice,
                          hinttxt: constants.txtItemPrice,
                          textController: priceController,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: context.spaces.space_300,
                        ),
                        CategoryDropDownWidget(
                          categoryList: data,
                          itemSelector: dropDownItem,
                        ),
                        LocationFeilddWidget(),
                        SizedBox(
                          height: context.spaces.space_200,
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
                            if (formKey.value.currentState!.validate()) {
                              // add products data
                              ref.read(productsProvider.notifier).addData(
                                    category: dropDownItem.value,
                                    description: descriptionController.text,
                                    imagePaths:
                                        ref.read(imageProvider).imageRefList,
                                    price: double.parse(priceController.text),
                                    productName: productNamecontroller.text,
                                  );
                            }
                          },
                          btnTxt: constants.txtBtn,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            error: (error, stackTrace) => Center(
              child: Column(
                children: [
                  Text(
                    ref.watch(errorConstantsProvider).txtWentWrong,
                    style: context.typography.body,
                  ),
                  SizedBox(
                    height: context.spaces.space_150,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.refresh),
                  )
                ],
              ),
            ),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
