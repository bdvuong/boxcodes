import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:boxcodes/services/firestore_service.dart';

class FirestoreProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();

  Stream<QuerySnapshot> getUsers() {
    return _firestoreService.getUsers();
  }

  Future<void> addUser(String userId, Map<String, dynamic> userData) async {
    await _firestoreService.addUser(userId, userData);
    notifyListeners();
  }

  Future<DocumentSnapshot> getUser(String userId) async {
    return await _firestoreService.getUser(userId);
  }

  Future<void> updateUser(String userId, Map<String, dynamic> userData) async {
    await _firestoreService.updateUser(userId, userData);
    notifyListeners();
  }

  Future<void> deleteUser(String userId) async {
    await _firestoreService.deleteUser(userId);
    notifyListeners();
  }
}
