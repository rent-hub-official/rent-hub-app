import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

class CheckBoxFilterWidget extends StatelessWidget {
  const CheckBoxFilterWidget(
      {super.key,
      required this.text,
      required this.onChanged,
      this.value = false});
  final String text;
  final void Function(bool? status) onChanged;
  final bool? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
              activeColor: context.colors.primary,
              value: value,
              onChanged: onChanged),
        ),
        Padding(
          padding: EdgeInsets.only(left: context.spaces.space_150),
          child: Text(
            text,
            style: context.typography.body,
          ),
        )
      ],
    );
  }
}
