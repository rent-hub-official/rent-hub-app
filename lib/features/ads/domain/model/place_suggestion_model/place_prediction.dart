import 'package:freezed_annotation/freezed_annotation.dart';

import 'structured_format.dart';
import 'text.dart';

part 'place_prediction.freezed.dart';
part 'place_prediction.g.dart';

@freezed
class PlacePrediction with _$PlacePrediction {
  factory PlacePrediction({
    String? place,
    String? placeId,
    Text? text,
    StructuredFormat? structuredFormat,
    List<String>? types,
  }) = _PlacePrediction;

  factory PlacePrediction.fromJson(Map<String, dynamic> json) =>
      _$PlacePredictionFromJson(json);
}
