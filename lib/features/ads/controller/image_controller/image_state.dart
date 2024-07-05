import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_state.g.dart';
part 'image_state.freezed.dart';

@freezed
class ImageState with _$ImageState {
  const factory ImageState({
    required List<String> imageRefList,
    required bool isLoading,
  }) = _ImageState;

  factory ImageState.fromJson(Map<String, dynamic> json) =>
      _$ImageStateFromJson(json);
}
