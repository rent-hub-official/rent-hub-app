import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rent_hub/core/extensions/app_theme_extension.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    super.key,
    required this.latLng,
  });

  final LatLng latLng;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.spaces.space_200),
      child: SizedBox(
        width: double.infinity,
        height: context.spaces.space_300 * 7.9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: latLng,
              zoom: 15,
            ),
            zoomControlsEnabled: false,
            markers: {
              Marker(
                markerId: MarkerId("mark"),
                visible: true,
                position: latLng,
              )
            },
          ),
        ),
      ),
    );
  }
}
