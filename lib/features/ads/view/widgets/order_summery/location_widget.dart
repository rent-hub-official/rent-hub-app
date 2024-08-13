import 'package:flutter/material.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.location,
  });
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(
            context.spaces.space_100,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: context.colors.primary,
              borderRadius: BorderRadius.circular(context.spaces.space_75),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.location_on),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(
            context.spaces.space_125,
          ),
          child: Text(
            location,
            style: context.typography.bodySemibold,
          ),
        )
      ],
    );
  }
}
