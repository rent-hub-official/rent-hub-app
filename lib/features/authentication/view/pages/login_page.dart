import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rent_hub/core/constants/image_constants.dart';
import 'package:rent_hub/core/constants/login_page_constants/login_page_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(loginPageConstantsProvider);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(context.spaces.space_200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(ref.watch(imageConstantsProvider).imgOtpGirl),
              SizedBox(
                height: context.spaces.space_100,
              ),
              Text(
                constants.txtHeading,
                style: context.typography.h2SemiBold,
              ),
              SizedBox(
                height: context.spaces.space_100,
              ),
              Text(
                constants.txtSubHeding,
                style: context.typography.h3,
              ),
              SizedBox(
                height: context.spaces.space_100,
              ),
              IntlPhoneField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: constants.txtPhoneNoExample,
                  labelText: constants.txtPhoneNo,
                  contentPadding: EdgeInsets.only(
                    bottom: context.spaces.space_200,
                  ),
                ),
              ),
              MainBtnWidget(
                onTap: () {
                  //TODO: Navigation
                },
                btnTxt: constants.txtOtpBtn,
              ),
              SizedBox(
                height: context.spaces.space_900,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
