import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/chat_box_constants/chat_box.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class InputMessageFieldWidget extends ConsumerWidget {
  const InputMessageFieldWidget({
    required this.controller,
    super.key,
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: context.spaces.space_800,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: ref.read(chatBoxConstantsProvider).txtType,
          hintStyle: context.typography.body,
          contentPadding:
              EdgeInsets.symmetric(vertical: context.spaces.space_200),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.colors.border),
            borderRadius: BorderRadius.circular(context.spaces.space_500),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: context.colors.border),
            borderRadius: BorderRadius.circular(context.spaces.space_500),
          ),

          ///add attachment button
          prefixIcon: Transform.rotate(
            angle: context.spaces.space_500,
            child: IconButton(
              onPressed: () {
                // TODO share attachments
              },
              icon: Icon(
                color: context.colors.secondary,
                Icons.attachment,
                size: context.spaces.space_300,
              ),
            ),
          ),
          // sent button
          suffixIcon: Padding(
            padding: EdgeInsets.all(context.spaces.space_100),
            child: CircleAvatar(
              backgroundColor: context.colors.secondary,
              child: Transform.rotate(
                angle: context.spaces.space_150,
                child: Padding(
                  padding: EdgeInsets.only(left: context.spaces.space_50),
                  child: IconButton(
                    onPressed: () {
                      // TODO fucton for sent messsage
                    },
                    icon: Icon(
                      Icons.send,
                      color: context.colors.primary,
                      size: context.spaces.space_250,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
