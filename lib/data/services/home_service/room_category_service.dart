import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/features/home/model/categories/room_category_model.dart';

class RoomCategoryService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Room categories for a given room
  Stream<List<RoomCategoryModel>> getRoomCategoriesStream(String roomId) {
    return _db
        .collection(FirebaseCollection.roomCategories)
        .where('roomId', isEqualTo: roomId)
        .where('isActive', isEqualTo: true)
        .orderBy('order')
        .snapshots()
        .map(
          (snap) => snap.docs
              .map((d) => RoomCategoryModel.fromJson(d.data(), d.id))
              .toList(),
        );
  }

  Future<void> addRoomCategoriesWithId(RoomCategoryModel model) async {
    await _db
        .collection(FirebaseCollection.roomCategories)
        .doc(model.id)
        .set(model.toJson());
  }
}
