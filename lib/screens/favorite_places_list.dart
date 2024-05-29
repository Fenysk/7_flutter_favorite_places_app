import 'package:flutter/material.dart';
import 'package:favorite_places_app/widgets/favorite_place_item.dart';
import 'package:favorite_places_app/screens/add_new_place.dart';

class FavoritePlacesList extends StatefulWidget {
  const FavoritePlacesList({super.key});

  @override
  State<FavoritePlacesList> createState() => _FavoritePlacesListState();
}

class _FavoritePlacesListState extends State<FavoritePlacesList> {
  final List<String> _favoritePlaces = [
    'Lyon',
    'Paris',
    'London',
  ];

  void _openAddNewPlaceScreen() async {
    final newPlace = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (builderContext) => const AddNewPlace(),
      ),
    );

    if (newPlace == null || newPlace.isEmpty) return;

    setState(() => _favoritePlaces.add(newPlace));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No favorite places added yet!'),
    );

    if (_favoritePlaces.isNotEmpty) {
      mainContent = ListView.builder(
        itemCount: _favoritePlaces.length,
        itemBuilder: (ctx, index) => FavoritePlaceItem(favoritePlace: _favoritePlaces[index]),
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
