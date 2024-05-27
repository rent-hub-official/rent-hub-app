import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rent_hub/core/constants/create_account_constants/create_account.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/core/widgets/textfeild_widget.dart';
import 'package:rent_hub/features/authentication/controller/account_details_provider/account_details_provider.dart';
import 'package:rent_hub/features/authentication/controller/authenticcation_provider/authentication_provider.dart';

class CreateAccountPage extends HookConsumerWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // name text editing controller
    final TextEditingController nameEditingController =
        useTextEditingController();

    final createAcConst = ref.watch(createAccountConstantProvider);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.spaces.space_200,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Text(
                createAcConst.txtHeading,
                style: context.typography.h1SemiBold,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: context.spaces.space_300 * 2,
                  bottom: context.spaces.space_400,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(
                    context.spaces.space_300 * 6,
                  ),
                  onTap: () async {
                    // image picker
                    XFile? img = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                    );

                    ref.read(imageProvider.notifier).state = img;

                    if (context.mounted && img != null) {
                      // upload image cloudstorage
                      await ref
                          .read(accountDetailsProvider.notifier)
                          .uploadImage(
                            context,
                            image: File(img.path),
                            userId:
                                ref.read(authenticationProvider).phoneNumber!,
                          );
                    }
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: context.spaces.space_300 * 4,
                        backgroundImage: ref.watch(imageProvider) != null
                            ? FileImage(
                                File(
                                  ref.watch(imageProvider)!.path,
                                ),
                              )
                            : null,
                      ),
                      Positioned(
                        left: context.spaces.space_900 * 2,
                        top: context.spaces.space_100 * 2,
                        child: CircleAvatar(
                          backgroundColor: context.colors.primary,
                          child: const Icon(Icons.add),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // Todo  dyvesh
              TextFeildWidget(
                labeltxt: createAcConst.txtLabelName,
                hinttxt: createAcConst.txtHintName,
                textController: nameEditingController,
                validator: (p0) {
                  return null;
                },
              ),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  createAcConst.txtSubtitle,
                  style: context.typography.bodySmall,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: context.spaces.space_300),
                child: MainBtnWidget(
                  onTap: () async {
                    await ref.read(accountDetailsProvider.notifier).addData(
                          context,
                          userId: ref.read(authenticationProvider).phoneNumber!,
                          userName: nameEditingController.text,
                        );
                    ref.invalidate(imageProvider);
                    nameEditingController.clear();
                    // TODO : navigate home page
                  },
                  btnTxt: createAcConst.txtbtn,
                ),
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
