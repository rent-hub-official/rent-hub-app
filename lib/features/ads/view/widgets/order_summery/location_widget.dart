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
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          color: context.colors.primary,
          borderRadius: BorderRadius.circular(context.spaces.space_75),
        ),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.location_on),
        ),
      ),
      title: Text(
        location,
        style: context.typography.bodySemibold,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
