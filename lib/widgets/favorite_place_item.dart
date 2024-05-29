import 'package:flutter/material.dart';
import 'package:favorite_places_app/model/place.dart';

class FavoritePlaceItem extends StatelessWidget {
  const FavoritePlaceItem({super.key, required this.favoritePlace});

  final Place favoritePlace;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        favoritePlace.id,
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
      title: Text(favoritePlace.title),
    );
  }
}
