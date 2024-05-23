import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/create_account_constants/create_account.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/core/widgets/textfeild_widget.dart';

class CreateAccountPage extends ConsumerWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();
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
                    bottom: context.spaces.space_400),
                child: SizedBox(
                  child: Stack(
                    children: [
                      InkWell(
                        borderRadius:
                            BorderRadius.circular(context.spaces.space_400 * 3),
                        onTap: () {},
                        child: CircleAvatar(
                          radius: context.spaces.space_300 * 4,
                        ),
                      ),
                      Positioned(
                        left: context.spaces.space_900 * 2,
                        top: context.spaces.space_100 * 2,
                        child: CircleAvatar(
                          backgroundColor: context.colors.primary,
                          child: IconButton(
                              onPressed: () {}, icon: const Icon(Icons.add)),
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
                textController: controller,
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
                  onTap: () {},
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
