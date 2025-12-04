import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/features/account/models/user_model.dart';

class UserFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(UserModel model) async {
    await _firestore
        .collection(FirebaseCollection.users)
        .doc(model.userId)
        .set(model.toMap());
  }

  Future<UserModel?> getUserData(String userId) async {
    final doc = await _firestore
        .collection(FirebaseCollection.users)
        .doc(userId)
        .get();
    if (!doc.exists) return null;

    return UserModel.fromMap(doc.data()!);
  }

  Future<void> updateUserData(UserModel model) async {
    await _firestore
        .collection(FirebaseCollection.users)
        .doc(model.userId)
        .update(model.toMap());
  }

  Future<bool> isUserExistById(String userId) async {
    final doc = await _firestore
        .collection(FirebaseCollection.users)
        .doc(userId)
        .get();
    return doc.exists;
  }

  Future<bool> isUserExistByEmail(String email) async {
    final user = await _firestore
        .collection(FirebaseCollection.users)
        .where('email', isEqualTo: email)
        .limit(1)
        .get();

    return user.docs.isNotEmpty;
  }
}
