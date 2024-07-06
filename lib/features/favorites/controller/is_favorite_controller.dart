import 'package:rent_hub/features/favorites/domain/usecase/checks_is_favorite_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_favorite_controller.g.dart';

///checks the product is favorite for the user
///recive ads docId [adId]
@riverpod
Future<bool> isFav(IsFavRef ref, String adId) async {
  return IsFavoriteUseCase()(adId: adId);
}
