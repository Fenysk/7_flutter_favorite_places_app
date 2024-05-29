import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places_app/model/place.dart';

class FavoritePlacesProvider extends StateNotifier<List<Place>> {
  FavoritePlacesProvider()
      : super([
          Place(title: 'Lyon'),
          Place(title: 'Paris'),
          Place(title: 'London'),
        ]);

  Place addNewPlace(Place newPlace) {
    state = [
      ...state,
      newPlace
    ];

    return newPlace;
  }
}

final favoritePlacesProvider = StateNotifierProvider<FavoritePlacesProvider, List<Place>>((ref) => FavoritePlacesProvider());
