import 'package:rent_hub/features/ads/domain/usecase/location_use_case/location_name_reduce_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_name_reduce_provider.g.dart';

@riverpod
String locationNameReduce(LocationNameReduceRef ref, String? locationName) {
  return LocationNameReduceUsecase()(locationName);
}
