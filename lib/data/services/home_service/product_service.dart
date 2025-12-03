import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/features/home/models/product/product_model.dart';

class ProductService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<ProductModel>> getProductsByCategoryStream(String categoryId) {
    return _db
        .collection(FirebaseCollection.products)
        .where('categoryId', isEqualTo: categoryId)
        .where('isActive', isEqualTo: true)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snap) => snap.docs
              .map((d) => ProductModel.fromJson(d.data(), d.id))
              .toList(),
        );
  }

  Future<ProductModel?> getProductById(String productId) async {
    final doc = await FirebaseFirestore.instance
        .collection(FirebaseCollection.products)
        .doc(productId)
        .get();

    if (!doc.exists) return null;

    return ProductModel.fromJson(doc.data()!, doc.id);
  }

  Future<void> addProductsByCategoryWithId(ProductModel model) async {
    await _db
        .collection(FirebaseCollection.products)
        .doc(model.id)
        .set(model.toJson());
  }

  Future<String> addProductId() async {
    return _db.collection(FirebaseCollection.products).doc().id;
  }

  Future<List<ProductModel>> getProductsForBestCategory(
    String bestCategoryId,
  ) async {
    final doc = await _db
        .collection(FirebaseCollection.bestCategories)
        .doc(bestCategoryId)
        .get();
    final productIds = List<String>.from(doc.data()?['products'] ?? []);
    final List<ProductModel> results = [];

    for (int i = 0; i < productIds.length; i += 10) {
      final batch = productIds.skip(i).take(10).toList();
      final qs = await _db
          .collection('products')
          .where(FieldPath.documentId, whereIn: batch)
          .where('isActive', isEqualTo: true)
          .get();

      results.addAll(
        qs.docs.map((d) => ProductModel.fromJson(d.data(), d.id)).toList(),
      );
    }

    return results;
  }

  Future<void> addProduct(ProductModel product) async {
    final docRef = _db.collection(FirebaseCollection.products).doc(product.id);
    await docRef.set(product.toJson());
  }

  Future<void> updateProduct(ProductModel product) async {
    final docRef = _db.collection(FirebaseCollection.products).doc(product.id);
    await docRef.update(product.toJson());
  }

  Future<void> deleteProduct(String productId) async {
    await _db.collection(FirebaseCollection.products).doc(productId).delete();
  }
}
