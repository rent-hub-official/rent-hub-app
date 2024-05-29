import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/payment_constants/add_account_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class DropDownBankListWidget extends HookConsumerWidget {
  DropDownBankListWidget({
    super.key,
  });

  // TODO fetch bank Names
  final List<String> bankNames = ['Others', 'one', 'two', 'three'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // add bank account constants
    final AddBankAccountConstants addBankConsts =
        ref.read(addBankAccountConstantsProvider);
    // index for controll dropdown
    final selectedBankIndex = useState<int?>(null);
    return DropdownButtonHideUnderline(
      child: DropdownButton<int>(
        hint: Text(addBankConsts.txtSelect),
        value: 0,
        items: [
          for (int i = 0; i < bankNames.length; i++)
            DropdownMenuItem(
              child: Text(bankNames[i]),
              value: i,
            )
        ],
        onChanged: (int? newValue) {
          //update index of dropdown bank names
          selectedBankIndex.value = newValue;
        },
        icon: Icon(Icons.keyboard_arrow_down),
        iconSize: context.spaces.space_400,
        elevation: 16,
        isExpanded: true,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
