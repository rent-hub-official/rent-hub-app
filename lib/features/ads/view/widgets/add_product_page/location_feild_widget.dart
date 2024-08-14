import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/ads/add_product.dart';
import 'package:rent_hub/core/constants/error_constants.dart';
import 'package:rent_hub/core/theme/color_palette.dart';
import 'package:rent_hub/core/widgets/textfield_widget.dart';
import 'package:rent_hub/features/ads/controller/location_controller/location_name_reduce_provider.dart';
import 'package:rent_hub/features/ads/controller/location_controller/place_details_provider.dart';
import 'package:rent_hub/features/ads/view/pages/location_selection_page.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class LocationFeilddWidget extends ConsumerWidget {
  LocationFeilddWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(placeDetailsProvider).when(
          data: (data) {
            return InkWell(
              onTap: () {
                context.push(
                  LocationSelectionPage.routePath,
                  extra: LatLng(
                    data?.results?.first.geometry?.location?.lat ??
                        22.715702381914507,
                    data?.results?.first.geometry?.location?.lng ??
                        79.1712949052453,
                  ),
                );
              },
              child: TextFieldWidget.TextFielddWidget(
                validator: (value) {
                  return null;
                },
                label: ref.watch(addProductConstantsProvider).txtLocation,
                textController: TextEditingController(
                  text: ref.watch(
                    locationNameReduceProvider(
                      data?.results?.first.formattedAddress,
                    ),
                  ),
                ),
                isEnabled: false,
              ),
            );
          },
          error: (error, stackTrace) => InkWell(
            onTap: () {
              context.push(LocationSelectionPage.routePath);
            },
            child: TextFieldWidget.TextFielddWidget(
              label: ref.watch(addProductConstantsProvider).txtLocation,
              textController: TextEditingController(
                text: ref.watch(errorConstantsProvider).txtWentWrong,
              ),
              isEnabled: false,
            ),
          ),
          loading: () => Shimmer.fromColors(
            highlightColor: AppColorPalettes.white100,
            baseColor: AppColorPalettes.white500,
            child: Container(
              width: double.infinity,
              height: 48,
              color: AppColorPalettes.white500,
            ),
          ),
        );
  }
}
