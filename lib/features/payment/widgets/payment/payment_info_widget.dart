import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class PaymentInfoWidget extends StatelessWidget {
  final String label;
  final String value;

  PaymentInfoWidget({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.spaces.space_100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            style: context.typography.bodyLarge,
          ),
          Text(
            value,
            style: context.typography.bodyLarge,
          ),
        ],
      ),
    );
  }
}
