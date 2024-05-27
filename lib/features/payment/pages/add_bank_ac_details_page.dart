import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/Payment_constants/add_account_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/core/widgets/rounded_btn_widget.dart';
import 'package:rent_hub/core/widgets/textfeild_widget.dart';
import 'package:rent_hub/features/payment/widgets/terms_condition_text_widget.dart';

class AddBankAcDetailsPage extends ConsumerWidget {
  AddBankAcDetailsPage({super.key});
  // TODO fetch bank Names
  final List<String> bankNames = ['Others', 'one', 'two', 'three'];

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
          addBankConsts.textCancel,
          style: context.typography.bodyLarge,
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              // TODO change button
              child: RoundedbtnWidget(
                icon: Icons.question_mark,
                onTap: () {},
                radius: context.spaces.space_250,
                backgroundclr: context.colors.primary,
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
                  child: Text(addBankConsts.textBankDetails,
                      style: context.typography.h2SemiBold),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    hint: Text(addBankConsts.textSelect),
                    value: ref.watch(selectedBankIndexProvider),
                    items: [
                      for (int i = 0; i < bankNames.length; i++)
                        DropdownMenuItem(
                          child: Text(bankNames[i]),
                          value: i,
                        )
                    ],
                    onChanged: (int? newValue) {
                      ref.read(selectedBankIndexProvider.notifier).state =
                          newValue;
                    },
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: context.spaces.space_400,
                    elevation: 16,
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                TextFeildWidget(
                  labeltxt: addBankConsts.textName,
                  hinttxt: addBankConsts.textAcHolder,
                  textController: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the name';
                    } else {
                      return null;
                    }
                  },
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: context.spaces.space_400),
                  child: TextFeildWidget(
                    labeltxt: addBankConsts.textIfsc,
                    hinttxt: addBankConsts.textAcHolder,
                    textController: ifscController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the IFSE';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                TextFeildWidget(
                  labeltxt: addBankConsts.textAcNumber,
                  hinttxt: addBankConsts.textAcNumber,
                  textController: acNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter the Account Number';
                    } else {
                      return null;
                    }
                  },
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: context.spaces.space_400),
                  child: TextFeildWidget(
                    labeltxt: addBankConsts.textConfirm,
                    hinttxt: addBankConsts.textConfirm,
                    textController: confirmAcNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter the Account Number';
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
                    btnTxt: addBankConsts.addAc)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final StateProvider<int?> selectedBankIndexProvider = StateProvider<int?>(
  (ref) => null,
);
