import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addUser(String userId, Map<String, dynamic> userData) {
    return _db.collection('users').doc(userId).set(userData);
  }

  Future<DocumentSnapshot> getUser(String userId) {
    return _db.collection('users').doc(userId).get();
  }

  Stream<QuerySnapshot> getUsers() {
    return _db.collection('users').snapshots();
  }

  Future<void> updateUser(String userId, Map<String, dynamic> userData) {
    return _db.collection('users').doc(userId).update(userData);
  }

  Future<void> deleteUser(String userId) {
    return _db.collection('users').doc(userId).delete();
  }
}
