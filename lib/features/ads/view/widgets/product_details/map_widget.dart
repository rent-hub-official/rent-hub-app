import 'package:flutter/material.dart';
import 'package:rent_hub/core/theme/app_theme.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.spaces.space_200),
      child: Container(
        width: double.infinity,
        height: context.spaces.space_300 * 7.9,
        decoration: BoxDecoration(
          color: Colors.green,
          //ToDO: MAP placeholder
          borderRadius: BorderRadius.all(
            Radius.circular(context.spaces.space_200),
          ),
        ),
      ),
    );
  }
}
