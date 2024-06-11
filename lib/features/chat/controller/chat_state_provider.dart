import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_state_provider.freezed.dart';
part 'chat_state_provider.g.dart';

@freezed
class ChatStateProvider with _$ChatStateProvider {
  const factory ChatStateProvider({
    required bool isLoading,
    required String? imageRef,
  }) = _ChatStateProvider;

  factory ChatStateProvider.fromJson(Map<String, dynamic> json) =>
      _$ChatStateProviderFromJson(json);
}