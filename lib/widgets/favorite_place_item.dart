import 'package:flutter/material.dart';

class FavoritePlaceItem extends StatelessWidget {
  const FavoritePlaceItem({super.key, required this.favoritePlace});

  final String favoritePlace;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(favoritePlace),
    );
  }
}
