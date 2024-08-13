import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/payment/add_account_constants.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

class DropDownBankListWidget extends HookConsumerWidget {
  DropDownBankListWidget({super.key});

  // List of bank names
  final List<String> bankNames = [
    'SBI',
    'HDFC',
    'ICICI',
    'KOTAK',
    'PUNJAB',
    'AXIS',
    'BOB',
    'others'
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Retrieve bank account constants
    final addBankConsts = ref.read(addBankAccountConstantsProvider);

    // State for the selected bank index
    final selectedBankIndex = useState<int?>(null);

    return DropdownButtonHideUnderline(
      child: DropdownButton<int>(
        hint: Text(addBankConsts.txtSelect),
        value: selectedBankIndex.value,
        items: [
          for (int i = 0; i < bankNames.length; i++)
            DropdownMenuItem(
              value: i,
              child: Text(bankNames[i]),
            ),
        ],
        onChanged: (int? newValue) {
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
