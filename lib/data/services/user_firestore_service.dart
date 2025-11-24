import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/features/account/models/complete_ddd_data_model.dart';

class UserFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(CompleteAddDataModel model) async {
    await _firestore
        .collection(FirebaseCollection.users)
        .doc(model.userId)
        .set(model.toMap());
  }

  Future<CompleteAddDataModel?> getUserData(String userId) async {
    final doc = await _firestore
        .collection(FirebaseCollection.users)
        .doc(userId)
        .get();
    if (!doc.exists) return null;

    return CompleteAddDataModel.fromMap(doc.data()!);
  }

  Future<void> updateUserData(String userId, Map<String, dynamic> data) async {
    await _firestore
        .collection(FirebaseCollection.users)
        .doc(userId)
        .update(data);
  }

  Future<bool> isUserExist(String userId) async {
    final doc = await _firestore
        .collection(FirebaseCollection.users)
        .doc(userId)
        .get();
    return doc.exists;
  }
}
