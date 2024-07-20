import 'package:freezed_annotation/freezed_annotation.dart';

part 'secondary_text.freezed.dart';
part 'secondary_text.g.dart';

@freezed
class SecondaryText with _$SecondaryText {
  factory SecondaryText({
    String? text,
  }) = _SecondaryText;

  factory SecondaryText.fromJson(Map<String, dynamic> json) =>
      _$SecondaryTextFromJson(json);
}
