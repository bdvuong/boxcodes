import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  final String id;
  final String name;
  final String type;

  Item({
    required this.id,
    required this.name,
    required this.type,
  });

  factory Item.fromDocument(DocumentSnapshot doc) {
    return Item(id: doc.id, name: doc['name'], type: doc['type']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
    };
  }
}
