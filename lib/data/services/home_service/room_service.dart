import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';

import 'package:depi_graduation_project/features/home/models/rooms/room_model.dart';

class RoomService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<RoomModel>> getRoomsStream() {
    return _db
        .collection(FirebaseCollection.rooms)
        .where('isActive', isEqualTo: true)
        .orderBy('order')
        .snapshots()
        .map(
          (snap) =>
              snap.docs.map((d) => RoomModel.fromJson(d.data(), d.id)).toList(),
        );
  }

  Future<void> addRoomsWithId(RoomModel model) async {
    await _db
        .collection(FirebaseCollection.rooms)
        .doc(model.id)
        .set(model.toJson());
  }

  Future<void> updateRoom(RoomModel model) async {
    final updatedModel = model.copyWith(updatedAt: DateTime.now());

    await _db
        .collection(FirebaseCollection.rooms)
        .doc(model.id)
        .update(updatedModel.toJsonForUpdate());
  }
}
