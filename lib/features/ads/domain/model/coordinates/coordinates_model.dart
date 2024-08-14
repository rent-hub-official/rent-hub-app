import 'package:freezed_annotation/freezed_annotation.dart';

part 'coordinates_model.freezed.dart';
part 'coordinates_model.g.dart';

@freezed
class CoodinatesModel with _$CoodinatesModel {
  factory CoodinatesModel({
    double? latitude,
    double? longitude,
  }) = _CoodinatesModel;

  factory CoodinatesModel.fromJson(Map<String, dynamic> json) =>
      _$CoodinatesModelFromJson(json);
}
