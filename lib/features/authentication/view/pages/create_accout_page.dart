import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/create_account_constants/create_account.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/textfeild_widget.dart';

class CreateAccountPage extends ConsumerWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = TextEditingController();
    final createAcConst = ref.watch(createAccountProvider);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.spaces.space_200),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.spaces.space_900 * 2,
                ),
                Text(
                  createAcConst.txtHeading,
                  style: context.typography.h1SemiBold,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: context.spaces.space_500 * 2,
                      bottom: context.spaces.space_600),
                  child: CircleAvatar(
                    radius: context.spaces.space_300 * 4,
                  ),
                ),
                TextFeildWidget(
                  labeltxt: createAcConst.txtLabelName,
                  hinttxt: createAcConst.txtHintName,
                  textController: controller,
                  prefixicon: Icon(Icons.person),
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
                Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
