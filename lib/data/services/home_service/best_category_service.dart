import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/features/home/models/categories/best_categories_model.dart';

class BestCategoryService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<BestCategoryModel>> getBestCategoriesStream() {
    return _db
        .collection(FirebaseCollection.bestCategories)
        .where('isActive', isEqualTo: true)
        .orderBy('order')
        .snapshots()
        .map(
          (snap) => snap.docs
              .map((d) => BestCategoryModel.fromJson(d.data(), d.id))
              .toList(),
        );
  }

  Future<void> addBestCategoryWithId(BestCategoryModel model) async {
    await _db
        .collection(FirebaseCollection.bestCategories)
        .doc(model.id)
        .set(model.toJson());
  }

  Future<void> updateBestCategory(BestCategoryModel model) async {
    final updatedModel = model.copyWith(updatedAt: DateTime.now());

    await _db
        .collection(FirebaseCollection.bestCategories)
        .doc(model.id)
        .update(updatedModel.toJsonForUpdate());
  }

  Future<void> addProductToBestCategory(String bestId, String productId) async {
    await _db.collection(FirebaseCollection.bestCategories).doc(bestId).update({
      'products': FieldValue.arrayUnion([productId]),
      'updatedAt': DateTime.now(),
    });
  }
}
