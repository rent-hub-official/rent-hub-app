import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/timeline_history_widget.dart';

Future<dynamic> historyBottomSheet(
  BuildContext context, {
  bool isPurchase = false,
  required String userProfileImg,
  required String usarName,
  required Function() callBtnPressed,
  required Function() msgBtnPressed,
  required String productImg,
  required String productName,
  required double productPrice,
  required double distance,
  required String location,
  required String verificationCode,
  required Function() rejectBtnPressed,
}) {
  return showModalBottomSheet(
    context: context,
    isDismissible: false,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.8,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.colors.cardBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(context.spaces.space_700),
                  topRight: Radius.circular(context.spaces.space_700),
                ),
              ),
              height: double.infinity,
              width: double.infinity,
            ),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height * 0.73,
              // Adjust this value as needed
              left: 0,
              right: 0,
              child: CircleAvatar(
                backgroundImage: NetworkImage(userProfileImg),
                radius: context.spaces.space_700,
              ),
            ),
            SizedBox(
              height: context.spaces.space_25,
            ),
            Positioned(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.spaces.space_200),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: context.spaces.space_700,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: context.spaces.space_125),
                        child: Text(
                          usarName,
                          style: context.typography.body,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: callBtnPressed,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context.colors.primary,
                            ),
                            child: Icon(
                              Icons.call,
                              color: context.colors.secondary,
                            ),
                          ),
                          VerticalDivider(),
                          ElevatedButton(
                            onPressed: msgBtnPressed,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context.colors.primary,
                            ),
                            child: Icon(
                              Icons.message,
                              color: context.colors.secondary,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: context.spaces.space_125,
                      ),
                      Container(
                        width: double.infinity,
                        height: 110,
                        child: Row(
                          children: [
                            Container(
                              width: context.spaces.space_400 * 5,
                              height: double.infinity,
                              child: Padding(
                                padding:
                                    EdgeInsets.all(context.spaces.space_100),
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          productImg,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          context.spaces.space_50)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: context.spaces.space_150,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    productName,
                                    style: context.typography.h3SemiBold,
                                  ),
                                  Text(
                                    '$productPrice/day',
                                    style: context.typography.bodyLargeSemiBold,
                                  ),
                                  Text(
                                    '$distance km faraway',
                                    style: context.typography.bodySmall,
                                  ),
                                  Text(
                                    location,
                                    style: context.typography.bodySmall,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: context.spaces.space_200),
                        child: TimeLineHistoryWidget(),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          isPurchase
                              ? Flexible(
                                  fit: FlexFit.tight,
                                  flex: 3,
                                  child: TextField(
                                    // controller: ,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: context.spaces.space_300,
                                        vertical: context.spaces.space_150,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          context.spaces.space_125,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: context.spaces.space_300,
                                    vertical: context.spaces.space_150,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: context.colors.border,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        context.spaces.space_125),
                                  ),
                                  child: Center(
                                      child: Text(
                                    verificationCode,
                                    style: context.typography.body,
                                  )),
                                ),
                          // spacer
                          Spacer(),
                          Text(
                            "OR",
                            style: context.typography.body,
                          ),
                          // spacer
                          Spacer(),
                          QrImageView(
                            data: verificationCode,
                            version: QrVersions.auto,
                            size: context.spaces.space_500 * 2,
                            eyeStyle: QrEyeStyle(
                              color: context.colors.primary,
                            ),
                            dataModuleStyle: QrDataModuleStyle(
                                color: context.colors.textSubtle),
                            // backgroundColor: context.colors.textSubtle,
                          ),
                        ],
                      ),
                      //  warning text
                      isPurchase
                          ? Text(
                              '* Make Sure Unique code is matching',
                              style: context.typography.bodySmall,
                            )
                          : Text(
                              '* you can’t cancel service after shares the unique code to the seller',
                              style: context.typography.bodySmall,
                            ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            flex: 3,
                            fit: FlexFit.tight,
                            child: MainBtnWidget(
                              onTap: () {
                                // pop bottom sheet
                                Navigator.pop(context);
                              },
                              btnTxt: "Cancel",
                            ),
                          ),
                          // reject button
                          SizedBox(
                            width:
                                isPurchase ? context.spaces.space_500 * 3 : 0,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: context.spaces.space_100,
                              ),
                              child: MainBtnWidget(
                                  onTap: rejectBtnPressed, btnTxt: "Reject"),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
