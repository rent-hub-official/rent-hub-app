import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';

class PayButton extends StatelessWidget {
  const PayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: context.spaces.space_200, right: context.spaces.space_200),
      child: MainBtnWidget(onTap: () {}, btnTxt: ''),
    );
  }
}