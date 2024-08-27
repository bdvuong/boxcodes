import "package:boxcodes/models/box.dart";
import "package:cloud_firestore/cloud_firestore.dart";

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addBox(Box box) async {
    try {
      if (box.id != null) {
        await _db.collection("containers").doc(box.id).set(box.toMap());
      } else {
        await _db.collection("containers").add(box.toMap());
      }
    } catch (e) {
      print("Error adding container: $e");
    }
  }

  Future<List<Box>> getAllBoxes() async {
    QuerySnapshot snapshot = await _db.collection("containers").get();
    return snapshot.docs.map((doc) => Box.fromDocument(doc)).toList();
  }

  Future<void> deleteBox(Box box) async {
    try {
      await _db.collection("containers").doc(box.id).delete();
    } catch (e) {
      print("Error deleting container: $e");
    }
  }
}
