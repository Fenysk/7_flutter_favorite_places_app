import 'package:flutter/material.dart';
import 'package:favorite_places_app/widgets/favorite_place_item.dart';
import 'package:favorite_places_app/screens/add_new_place.dart';
import 'package:favorite_places_app/model/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places_app/providers/favorite_places_provider.dart';

class FavoritePlacesList extends ConsumerStatefulWidget {
  const FavoritePlacesList({super.key});

  @override
  ConsumerState<FavoritePlacesList> createState() => _FavoritePlacesListState();
}

class _FavoritePlacesListState extends ConsumerState<FavoritePlacesList> {
  void _openAddNewPlaceScreen() {
    Navigator.of(context).push<Place>(
      MaterialPageRoute(
        builder: (builderContext) => const AddNewPlace(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Place> favoritePlaces = ref.watch(favoritePlacesProvider);

    Widget mainContent = const Center(
      child: Text('No favorite places added yet!'),
    );

    if (favoritePlaces.isNotEmpty) {
      mainContent = ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (ctx, index) => FavoritePlaceItem(favoritePlace: favoritePlaces[index]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddNewPlaceScreen,
          ),
        ],
      ),
      body: mainContent,
    );
  }
}
