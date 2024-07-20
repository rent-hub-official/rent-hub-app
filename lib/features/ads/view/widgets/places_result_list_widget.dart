import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rent_hub/core/constants/error_constants.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/features/ads/controller/location_controller/location_search_provider.dart';
import 'package:rent_hub/features/ads/controller/location_controller/place_lat_long_provider.dart';
import 'package:rent_hub/features/ads/view/widgets/places_tile_loading_widget.dart';

class PlacesResultListWidget extends ConsumerWidget {
  const PlacesResultListWidget({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(locationSearchProvider).when(
          data: (data) => ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => Card(
              color: context.colors.cardBackground,
              child: ListTile(
                onTap: () {
                  ref.read(placeLatLongProvider.notifier).get(
                        data[index].placeId ?? '',
                      );
                  ref.invalidate(locationSearchProvider);
                  ref.invalidate(locationBtnProvider);
                  searchController.clear();
                },
                leading: Icon(
                  Icons.trending_up,
                  color: context.colors.secondary,
                ),
                title: Text(data[index].structuredFormat?.mainText?.text ?? ""),
                subtitle: Text(
                    data[index].structuredFormat?.secondaryText?.text ?? ""),
              ),
            ),
            itemCount: data.length,
          ),
          error: (error, stackTrace) => Card(
            color: context.colors.cardBackground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(ref.watch(errorConstantsProvider).txtWentWrong),
            ),
          ),
          loading: () => ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => Card(
              color: context.colors.cardBackground,
              child: PlacesTileLoadingWidget(),
            ),
            itemCount: 6,
          ),
        );
  }
}
