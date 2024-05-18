import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'favourites.g.dart';

class Favourites {
  final  txtFavourite = "Favourites";
  final  txtNoFavourite = "NO Favourites";
}

@riverpod
Favourites favourites(FavouritesRef ref) {
  return Favourites();
}
