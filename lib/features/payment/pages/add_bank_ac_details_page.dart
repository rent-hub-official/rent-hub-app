import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/payment/add_account_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/core/widgets/textfeild_widget.dart';
import 'package:rent_hub/features/payment/widgets/drop_down_bank_names_widget.dart';
import 'package:rent_hub/features/payment/widgets/terms_condition_text_widget.dart';

class AddBankAcDetailsPage extends ConsumerWidget {
  AddBankAcDetailsPage({super.key});
  // router path
  static const routePath = '/addBankAcDetailsPage';
  // controllers for bank details
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();
  final TextEditingController acNumberController = TextEditingController();
  final TextEditingController confirmAcNumberController =
      TextEditingController();
  // form validation key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addBankConsts = ref.watch(addBankAccountConstantsProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          addBankConsts.txtCancel,
          style: context.typography.bodyLarge,
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: RoundedIconButton(
                icon: Icons.question_mark,
                onTap: () {
                  // TODO navigate to previos page
                },
                radius: context.spaces.space_250,
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: context.spaces.space_200,
          right: context.spaces.space_200,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: context.spaces.space_600,
                    bottom: context.spaces.space_400,
                  ),
                  child: Text(addBankConsts.txtBankDetails,
                      style: context.typography.h2SemiBold),
                ),

                /// Drop down list for select bank name
                DropDownBankListWidget(),

                /// Text fields for enter bank account details
                TextFeildWidget(
                  labeltxt: addBankConsts.txtName,
                  hinttxt: addBankConsts.txtAcHolder,
                  textController: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '${addBankConsts.txtName} ${addBankConsts.txtCantBeNull}';
                    } else {
                      return null;
                    }
                  },
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: context.spaces.space_400),
                  child: TextFeildWidget(
                    labeltxt: addBankConsts.txtIfsc,
                    hinttxt: addBankConsts.txtAcHolder,
                    textController: ifscController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '${addBankConsts.txtIfsc} ${addBankConsts.txtCantBeNull}';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                TextFeildWidget(
                  labeltxt: addBankConsts.txtAcNumber,
                  hinttxt: addBankConsts.txtAcNumber,
                  textController: acNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '${addBankConsts.txtAcNumber} ${addBankConsts.txtCantBeNull}';
                    } else {
                      return null;
                    }
                  },
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: context.spaces.space_400),
                  child: TextFeildWidget(
                    labeltxt: addBankConsts.txtConfirm,
                    hinttxt: addBankConsts.txtConfirm,
                    textController: confirmAcNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '${addBankConsts.txtAcNumber} ${addBankConsts.txtCantBeNull}';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: context.spaces.space_900 * 2,
                ),
                TermsAndConditionText(addBankConsts: addBankConsts),
                MainBtnWidget(
                    onTap: () {
                      // TODO add functionalities
                    },
                    btnTxt: addBankConsts.txtAddAc)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
