import 'package:flutter/material.dart';
import 'package:favorite_places_app/model/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places_app/providers/favorite_places_provider.dart';

class AddNewPlace extends ConsumerStatefulWidget {
  const AddNewPlace({super.key});

  @override
  ConsumerState<AddNewPlace> createState() => _AddNewPlaceState();
}

class _AddNewPlaceState extends ConsumerState<AddNewPlace> {
  String placeName = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validatePlaceName(String? placeNameField) {
    if (placeNameField == null || placeNameField.trim().isEmpty) return 'Please enter a name';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    void submitNewPlace() {
      if (!_formKey.currentState!.validate()) return;

      _formKey.currentState!.save();

      ref.read(favoritePlacesProvider.notifier).addNewPlace(Place(title: placeName));

      Navigator.of(context).pop();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new favorite place"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Title"),
                validator: (String? value) => _validatePlaceName(value),
                onSaved: (String? value) => placeName = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: submitNewPlace,
                child: const Text("Add to favorites"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
