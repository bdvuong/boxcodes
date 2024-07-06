import 'package:boxcodes/models/box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Add container to database
  Future<void> addBox(Box box) async {
    try {
      await _db.collection('containers').add(box.toMap());
    } catch (e) {
      print('Error adding container: $e');
    }
  }
}
