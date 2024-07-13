import 'package:freezed_annotation/freezed_annotation.dart';

import 'match.dart';

part 'main_text.freezed.dart';
part 'main_text.g.dart';

@freezed
class MainText with _$MainText {
  factory MainText({
    String? text,
    List<Match>? matches,
  }) = _MainText;

  factory MainText.fromJson(Map<String, dynamic> json) =>
      _$MainTextFromJson(json);
}
