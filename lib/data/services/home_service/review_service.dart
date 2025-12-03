import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/features/home/models/product/review_model.dart';

class ReviewService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addReviewWithUserId({
    required String productId,
    required ReviewModel review,
  }) async {
    await _db.collection(FirebaseCollection.products).doc(productId).update({
      "reviews": FieldValue.arrayUnion([review.toJson()]),
    });
  }
}
