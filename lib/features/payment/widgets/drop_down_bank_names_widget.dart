import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/Payment_constants/add_account_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class DropDownBankListWidget extends ConsumerWidget {
  DropDownBankListWidget({
    super.key,
  });

  // TODO fetch bank Names
  final List<String> bankNames = ['Others', 'one', 'two', 'three'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AddBankAccountConstants addBankConsts =
        ref.read(addBankAccountConstantsProvider);
    return DropdownButtonHideUnderline(
      child: DropdownButton<int>(
        hint: Text(addBankConsts.textSelect),
        value: 0,
        items: [
          for (int i = 0; i < bankNames.length; i++)
            DropdownMenuItem(
              child: Text(bankNames[i]),
              value: i,
            )
        ],
        onChanged: (int? newValue) {
          // ref.read(selectedBankIndexProvider.notifier).state = newValue;
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
