import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/features/home/model/product/product_model.dart';

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

  Future<void> addProductsByCategoryWithId(ProductModel model) async {
    await _db
        .collection(FirebaseCollection.products)
        .doc(model.id)
        .set(model.toJson());
  }

  // Get products for a best category (batch 'in' queries, supports >10 handling)
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

  // // Flexible product query with filters + pagination example
  // Future<List<ProductModel>> queryProducts({
  //   String? roomId,
  //   String? categoryId,
  //   String? color,
  //   String? productType,
  //   String? quality,
  //   double? minPrice,
  //   double? maxPrice,
  //   DocumentSnapshot? lastDoc,
  //   int limit = 20,
  // }) async {
  //   Query q = _db
  //       .collection(FirebaseCollection.products)
  //       .where('isActive', isEqualTo: true);

  //   if (roomId != null) q = q.where('roomId', isEqualTo: roomId);
  //   if (categoryId != null) q = q.where('categoryId', isEqualTo: categoryId);
  //   if (color != null && color != 'All') q = q.where('color', isEqualTo: color);
  //   if (productType != null && productType != 'All')
  //     q = q.where('productType', isEqualTo: productType);
  //   if (quality != null && quality != 'All')
  //     q = q.where('quality', isEqualTo: quality);

  //   q = q.orderBy('createdAt', descending: true).limit(limit);

  //   if (lastDoc != null) q = q.startAfterDocument(lastDoc);

  //   final qs = await q.get();
  //   List<ProductModel> items = qs.docs
  //       .map((d) => ProductModel.fromJson(d.data()!, d.id))
  //       .toList();

  //   // client-side price filter (Firestore doesn't support range + multiple where easily)
  //   if ((minPrice != null) || (maxPrice != null)) {
  //     items = items.where((p) {
  //       if (minPrice != null && p.price < minPrice) return false;
  //       if (maxPrice != null && p.price > maxPrice) return false;
  //       return true;
  //     }).toList();
  //   }

  //   return items;
  // }

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
