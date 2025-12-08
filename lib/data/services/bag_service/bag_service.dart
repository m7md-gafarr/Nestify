import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/features/bag/models/bag/bag_item_model.dart';
import 'package:depi_graduation_project/features/bag/models/bag/bag_model.dart';
import 'package:depi_graduation_project/features/bag/models/order/order_model.dart';
import 'package:depi_graduation_project/features/home/models/product/product_model.dart';

class BagService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<BagModel> listenToBagItems(String userId) {
    return _db.collection(FirebaseCollection.bag).doc(userId).snapshots().map((
      snapshot,
    ) {
      if (!snapshot.exists) return BagModel(items: []);
      return BagModel.fromJson(snapshot.data()!);
    });
  }

  Future<void> addOrIncrementItem({
    required String userId,
    required ProductModel product,
  }) async {
    final docRef = _db.collection(FirebaseCollection.bag).doc(userId);

    return _db.runTransaction((tx) async {
      final snap = await tx.get(docRef);

      if (!snap.exists) {
        tx.set(docRef, {
          "items": [BagItemModel(productId: product.id, quantity: 1).toJson()],
        });
        return;
      }

      final data = snap.data() as Map<String, dynamic>;
      final List items = data["items"] ?? [];

      List<Map<String, dynamic>> updatedItems = items
          .map((e) => Map<String, dynamic>.from(e))
          .toList();

      final index = updatedItems.indexWhere(
        (e) => e["productId"] == product.id,
      );

      if (index == -1) {
        updatedItems.add({"productId": product.id, "quantity": 1});
      } else {
        updatedItems[index]["quantity"] =
            (updatedItems[index]["quantity"] as int) + 1;
      }

      tx.update(docRef, {"items": updatedItems});
    });
  }

  Future<void> updateQuantity({
    required String userId,
    required String productId,
    required int change,
  }) async {
    final docRef = _db.collection(FirebaseCollection.bag).doc(userId);

    return _db.runTransaction((tx) async {
      final snap = await tx.get(docRef);

      if (!snap.exists) return;

      final data = snap.data() as Map<String, dynamic>;
      final List items = data["items"] ?? [];

      List<Map<String, dynamic>> updatedItems = items
          .map((e) => Map<String, dynamic>.from(e))
          .toList();

      final index = updatedItems.indexWhere((e) => e["productId"] == productId);

      if (index == -1) return;

      int oldQty = updatedItems[index]["quantity"];
      int newQty = oldQty + change;

      if (newQty <= 0) {
        updatedItems.removeAt(index);
      } else {
        updatedItems[index]["quantity"] = newQty;
      }

      tx.update(docRef, {"items": updatedItems});
    });
  }

  Future<void> removeItem({
    required String userId,
    required String productId,
  }) async {
    final docRef = _db.collection(FirebaseCollection.bag).doc(userId);

    return _db.runTransaction((tx) async {
      final snap = await tx.get(docRef);

      if (!snap.exists) return;

      final data = snap.data() as Map<String, dynamic>;
      final List items = data["items"] ?? [];

      List<Map<String, dynamic>> updatedItems = items
          .map((e) => Map<String, dynamic>.from(e))
          .toList();

      updatedItems.removeWhere((e) => e["productId"] == productId);

      tx.update(docRef, {"items": updatedItems});
    });
  }

  Future<void> saveOrder(OrderModel order, String userId) async {
    final doc = _db.collection(FirebaseCollection.orders).doc(userId);
    await doc.set({
      "orders": FieldValue.arrayUnion([order.toMap()]),
    }, SetOptions(merge: true));
  }

  Future<void> clearBag(String userId) async {
    await _db.collection(FirebaseCollection.bag).doc(userId).set({"items": []});
  }
}
