import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/features/saved_items/models/saved_item_model.dart';

class SavedItemService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<SavedItemModel> listenToSavedItems(String userId) {
    return _db
        .collection(FirebaseCollection.savedItems)
        .doc(userId)
        .snapshots()
        .map((snapshot) {
          if (!snapshot.exists) return SavedItemModel(productId: []);

          return SavedItemModel.fromJson(snapshot.data()!);
        });
  }

  Future<void> addSavedItem({
    required String userId,
    required SavedItemModel model,
  }) async {
    await _db.collection(FirebaseCollection.savedItems).doc(userId).set({
      "productId": FieldValue.arrayUnion(model.productId),
    }, SetOptions(merge: true));
  }

  Future<void> removeSavedItem({
    required String userId,
    required SavedItemModel model,
  }) async {
    await _db.collection(FirebaseCollection.savedItems).doc(userId).update({
      "productId": FieldValue.arrayRemove(model.productId),
    });
  }

  Future<SavedItemModel> getSavedItems(String userId) async {
    final doc = await _db
        .collection(FirebaseCollection.savedItems)
        .doc(userId)
        .get();

    if (!doc.exists) return SavedItemModel(productId: []);

    return SavedItemModel.fromJson(doc.data()!);
  }
}
