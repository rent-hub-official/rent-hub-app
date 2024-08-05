import 'package:freezed_annotation/freezed_annotation.dart';

part 'router_state.freezed.dart';
part 'router_state.g.dart';

@freezed
class RouterState with _$RouterState {
  factory RouterState({
    String? image,
    String? name,
    String? userId,
    String? receiverId,
  }) = _RouterState;

  factory RouterState.fromJson(Map<String, dynamic> json) =>
      _$RouterStateFromJson(json);
}
