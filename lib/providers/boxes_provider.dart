import 'package:boxcodes/models/box.dart';
import 'package:boxcodes/providers/firestore_provider.dart';
import 'package:flutter/material.dart';

class BoxesProvider extends ChangeNotifier {
  // TODO: Globalize App state to respond to changes when editing a box
  final FirestoreProvider _firestoreProvider = FirestoreProvider();

  Future<List<Box>>? _boxesData;
  bool _isLoading = false;
  String? _errorMessage;

  Future<List<Box>>? get boxesData => _boxesData;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void fetchBoxesData() async {
    try {
      _isLoading = true;
      _boxesData = _firestoreProvider.getAllBoxes();
    } catch (e) {
      _errorMessage = "Failed to load containers $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void add(Box box) {}
}
