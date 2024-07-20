import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/ads/location_selection.dart';
import 'package:rent_hub/core/constants/error_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/core/widgets/main_btn_widget.dart';
import 'package:rent_hub/features/ads/controller/location_controller/place_details_provider.dart';
import 'package:rent_hub/features/ads/controller/location_controller/place_lat_long_provider.dart';
import 'package:rent_hub/features/ads/view/widgets/location_selection_appbar_widget.dart';
import 'package:rent_hub/features/ads/view/widgets/places_result_list_widget.dart';

class LocationSelectionPage extends HookConsumerWidget {
  static const routePath = '/locationSelectionPage';

  const LocationSelectionPage({
    super.key,
    required this.latLng,
  });

  final LatLng latLng;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();

    final latLongController = useState(LatLng(0, 0));

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: locaSelectionAppBarWidget(
        context: context,
        searchController: searchController,
      ),
      body: Stack(
        children: [
          ref.watch(placeLatLongProvider).when(
                data: (data) {
                  return GoogleMap(
                    onMapCreated: (controller) {
                      latLongController.value = LatLng(
                        data?.latitude ?? latLng.latitude,
                        data?.longitude ?? latLng.longitude,
                      );
                    },
                    initialCameraPosition: CameraPosition(
                      target: data != null
                          ? LatLng(data.latitude ?? 0, data.longitude ?? 0)
                          : latLng,
                      zoom: data != null ||
                              latLng !=
                                  LatLng(22.715702381914507, 79.1712949052453)
                          ? 15
                          : 4.5,
                    ),
                    compassEnabled: false,
                    zoomControlsEnabled: false,
                    onTap: (argument) {
                      latLongController.value = argument;
                    },
                    markers: {
                      Marker(
                        markerId: MarkerId("selected_mark"),
                        visible: true,
                        position: latLongController.value,
                      )
                    },
                  );
                },
                error: (error, stackTrace) => Center(
                  child: Column(
                    children: [
                      Text(
                        ref.watch(errorConstantsProvider).txtWentWrong,
                        style: context.typography.body,
                      ),
                      SizedBox(
                        height: context.spaces.space_150,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.refresh),
                      )
                    ],
                  ),
                ),
                loading: () => Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          PlacesResultListWidget(searchController: searchController),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ref.watch(locationBtnProvider)
          ? null
          : Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: context.spaces.space_100),
              child: MainBtnWidget(
                onTap: () {
                  ref
                      .read(placeDetailsProvider.notifier)
                      .fromLatlng(latLongController.value);

                  context.pop();
                },
                btnTxt: ref.watch(locationSelectionConstantsProvider).txtBtn,
              ),
            ),
    );
  }
}
