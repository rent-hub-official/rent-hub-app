import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/ads/seller_profile.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/features/chat/widgets/seller_profile_widget.dart';

// Define the BottomSheetContent widget
class BottomSheetContent extends ConsumerWidget {
  BottomSheetContent({
    required this.userImage,
    required this.reasonText,
    required this.typingLabel,
    required this.continueButtonText,
    required this.ontap
  });
  final String userImage;
  final String reasonText;
  final String typingLabel;
  final String continueButtonText;
  final void Function() ontap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController textController = TextEditingController();
    final constants = ref.watch(sellerProfileProvider);
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 100),
        child: SizedBox(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ProfieWidget(userimg: userImage),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 0, bottom: context.spaces.space_200),
                    child: Text(reasonText, style: context.typography.h1Bold),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.spaces.space_400),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: typingLabel,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(context.spaces.space_400),
                    child: MainBtnWidget(
                        onTap: ontap, btnTxt: constants.txtContinue),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
