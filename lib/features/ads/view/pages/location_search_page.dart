import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rent_hub/core/constants/ads/user_search_detailes.dart';
import 'package:rent_hub/core/theme/app_theme.dart';
import 'package:rent_hub/features/ads/controller/location_controller/location_search_provider.dart';
import 'package:rent_hub/features/ads/controller/location_controller/user_saved_location_provider.dart';
import 'package:rent_hub/features/ads/view/widgets/search_field_widget.dart';

class LocationSearchPage extends ConsumerWidget {
  static const routePath = '/locationSearchPage';

  const LocationSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: context.spaces.space_900,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: context.spaces.space_300),
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        title: SearchFieldWidget(
          hintText: ref.watch(userSearchDetailesProvider).txtSearch,
          onChanged: (value) {
            ref.read(locationSearchProvider.notifier).search(value);
          },
          onFieldSubmitted: (value) {
            ref.read(locationSearchProvider.notifier).search(value);
          },
          prefixIcon: Icon(Icons.search),
        ),
      ),
      body: ref.watch(locationSearchProvider).when(
            data: (data) => ListView.builder(
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  ref.read(userSavedLocationProvider.notifier).saveLoction(
                        mainText: data[index].structuredFormat?.mainText?.text,
                        secondaryText:
                            data[index].structuredFormat?.secondaryText?.text,
                      );
                },
                leading: Icon(
                  Icons.location_on_outlined,
                  color: context.colors.secondary,
                ),
                title: Text(
                  data[index].structuredFormat?.mainText?.text ?? "",
                ),
                subtitle: Text(
                  data[index].structuredFormat?.secondaryText?.text ?? "",
                ),
              ),
              itemCount: data.length,
            ),
            error: (error, stackTrace) => Center(
              child: Text(
                error.toString(),
                style: context.typography.body,
              ),
            ),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
