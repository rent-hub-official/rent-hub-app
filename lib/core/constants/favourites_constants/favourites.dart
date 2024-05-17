import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'favourites.g.dart';

class Favourites {
  final String txtFavourite = "Favourites";
  final String txtNoFavourite = "NO Favourites";
}

@riverpod
Favourites favourites(FavouritesRef ref) {
  return Favourites();
}
