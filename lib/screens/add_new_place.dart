import 'package:flutter/material.dart';
import 'package:favorite_places_app/model/place.dart';

class AddNewPlace extends StatefulWidget {
  const AddNewPlace({super.key});

  @override
  State<AddNewPlace> createState() => _AddNewPlaceState();
}

class _AddNewPlaceState extends State<AddNewPlace> {
  String placeName = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validatePlaceName(String? placeNameField) {
    if (placeNameField == null || placeNameField.isEmpty || placeNameField.trim().isEmpty) return 'Please enter a valid name';
    return null;
  }

  void _submitNewPlace() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    Navigator.of(context).pop(Place(title: placeName));
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: _submitNewPlace,
                child: const Text("Add to favorites"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
