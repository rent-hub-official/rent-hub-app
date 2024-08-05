import 'package:freezed_annotation/freezed_annotation.dart';

import 'router_state.dart';

part 'payload.freezed.dart';
part 'payload.g.dart';

@freezed
class Payload with _$Payload {
  factory Payload({
    String? routerPath,
    RouterState? routerState,
  }) = _Payload;

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);
}
