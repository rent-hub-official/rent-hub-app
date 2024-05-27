import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_details_state.freezed.dart';
part 'account_details_state.g.dart';

@freezed
class AccountDetailsState with _$AccountDetailsState {
  const factory AccountDetailsState({
    required bool isLoading,
    required String? imageRef,
  }) = _AccountDetailsState;

  factory AccountDetailsState.fromJson(Map<String, dynamic> json) =>
      _$AccountDetailsStateFromJson(json);
}
