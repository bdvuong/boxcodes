import 'package:cloud_firestore/cloud_firestore.dart';

class Box {
  String? id;
  final String name;
  final String description;
  final Timestamp createdDate;

  Box({
    required this.id,
    required this.name,
    required this.description,
    required this.createdDate,
  });

  factory Box.fromDocument(DocumentSnapshot doc) {
    return Box(
      id: doc.id,
      name: doc['name'],
      description: doc['description'],
      createdDate: doc['createdDate'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'createdDate': createdDate,
    };
  }
}
