import 'package:boxcodes/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:boxcodes/models/box.dart';

class FirestoreProvider with ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();

  Future<void> addBox(Box box) async {
    await _firestoreService.addBox(box);
  }

  Future<List<Box>> getAllBoxes() async {
    return await _firestoreService.getAllBoxes();
  }
}
