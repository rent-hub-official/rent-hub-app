import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

class RadioButtonWidget<T> extends StatelessWidget {
  const RadioButtonWidget({
    super.key,
    required this.label,
    required this.onChanged,
    required this.value,
    required this.groupValue,
  });
  final String label;
  final void Function(T? value)? onChanged;
  final T value;
  final T groupValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Radio<T>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 10),
        Padding(
          padding: EdgeInsets.only(left: context.spaces.space_150),
          child: Text(
            label,
            style: context.typography.body,
          ),
        )
      ],
    );
  }
}
