import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';

class SubscribeService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addSubscriberWithUserId({
    required String userId,
    required String email,
  }) async {
    await _db.collection(FirebaseCollection.subscribes).doc(userId).set({
      "email": email,
      "userId": userId,
      "createdAt": DateTime.now(),
    });
  }

  Future<bool> isUserSubscribed(String userId) async {
    final doc = await FirebaseFirestore.instance
        .collection(FirebaseCollection.subscribes)
        .doc(userId)
        .get();

    return doc.exists;
  }
}
