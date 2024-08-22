import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/ads/add_product.dart';
import 'package:rent_hub/core/constants/error_constants.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/core/widgets/textfield_widget.dart';
import 'package:rent_hub/features/ads/controller/category_controller/category_provider.dart';
import 'package:rent_hub/features/ads/controller/product_controller/fetch_catagary_products_provider.dart';
import 'package:rent_hub/features/ads/controller/product_controller/product_controller.dart';
import 'package:rent_hub/features/ads/domain/model/ads/ads_model.dart';
import 'package:rent_hub/features/ads/view/widgets/add_product_page/category_drop_drown_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/add_product_page/description_feild_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/add_product_page/image_selector_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/add_product_page/location_feild_widget.dart';

class AddProductPage extends HookConsumerWidget {
  static const routePath = '/addProduct';

  const AddProductPage({super.key, this.adsModel});
  final AdsModel? adsModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(addProductConstantsProvider);
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final productNamecontroller =
        useTextEditingController(text: adsModel?.productName);
    final priceController =
        useTextEditingController(text: adsModel?.price.toString());
    final descriptionController =
        useTextEditingController(text: adsModel?.description);
    final dropDownItem = useState<String?>(null);
    final imagesState = useState(adsModel?.imagePath ?? []);

    Future<void> postOrUpdateProduct() async {
      if (formKey.currentState!.validate()) {
        // add products data
        ref.read(productsProvider.notifier).addData(
              category: dropDownItem.value,
              description: descriptionController.text,
              imagePaths: imagesState.value,
              price: double.parse(priceController.text),
              productName: productNamecontroller.text,
            );

        ref.invalidate(fetchCatagorisedProductsProvider);
      }
    }

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
          adsModel != null ? 'Edit Product' : constants.txtHeading,
          style: context.typography.h2SemiBold,
        ),
      ),
      body: ref.watch(getCategoryProvider).when(
            data: (data) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(context.spaces.space_200),
                  child: Form(
                    key: formKey,
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
                        ImageSelectorWidget(
                          imagesState: imagesState,
                        ),
                        SizedBox(
                          height: context.spaces.space_100,
                        ),
                        TextFieldWidget.TextFielddWidget(
                          label: constants.txtProductName,
                          hintText: constants.txtGiveItemName,
                          textController: productNamecontroller,
                        ),
                        SizedBox(
                          height: context.spaces.space_100,
                        ),
                        TextFieldWidget.TextFielddWidget(
                          label: constants.txtPrice,
                          hintText: constants.txtItemPrice,
                          textController: priceController,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: context.spaces.space_300,
                        ),
                        CategoryDropDownWidget(
                          category: adsModel?.category,
                          categoryList: data,
                          itemSelector: dropDownItem,
                        ),
                        LocationFeilddWidget(
                          adsModel: adsModel,
                        ),
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
                        PrimaryBtnWidget(
                          onTap: postOrUpdateProduct,
                          isLoading: ref.watch(productsProvider),
                          label: constants.txtBtn,
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
