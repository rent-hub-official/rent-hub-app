// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'plus_code.freezed.dart';
part 'plus_code.g.dart';

@freezed
class PlusCode with _$PlusCode {
  factory PlusCode({
    @JsonKey(name: 'compound_code') String? compoundCode,
    @JsonKey(name: 'global_code') String? globalCode,
  }) = _PlusCode;

  factory PlusCode.fromJson(Map<String, dynamic> json) =>
      _$PlusCodeFromJson(json);
}
