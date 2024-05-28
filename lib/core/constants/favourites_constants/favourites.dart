import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'favourites.g.dart';

class FavouritesConstants {
  final txtFavourite = "Favourites";
  final txtNoFavourite = "NO Favourites";
}

@riverpod
FavouritesConstants favouritesConstants(FavouritesConstantsRef ref) {
  return FavouritesConstants();
}
