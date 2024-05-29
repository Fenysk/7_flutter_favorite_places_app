import 'package:uuid/uuid.dart';

const uuid = Uuid();

String get generatedId => 'plce_${uuid.v4().replaceAll('-', '').substring(0, 8)}';

class Place {
  Place({required this.title}) : id = generatedId;

  final String id;
  final String title;
}
