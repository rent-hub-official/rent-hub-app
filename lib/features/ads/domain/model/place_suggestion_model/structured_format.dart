import 'package:freezed_annotation/freezed_annotation.dart';

import 'main_text.dart';
import 'secondary_text.dart';

part 'structured_format.freezed.dart';
part 'structured_format.g.dart';

@freezed
class StructuredFormat with _$StructuredFormat {
  factory StructuredFormat({
    MainText? mainText,
    SecondaryText? secondaryText,
  }) = _StructuredFormat;

  factory StructuredFormat.fromJson(Map<String, dynamic> json) =>
      _$StructuredFormatFromJson(json);
}
