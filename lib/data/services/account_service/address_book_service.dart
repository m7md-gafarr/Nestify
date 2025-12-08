import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/features/account/models/address_book/address_book_model.dart';

class AddressBookService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addAddress(AddressBookModel model, String userId) async {
    await _firestore.collection(FirebaseCollection.addressBook).doc(userId).set(
      {
        'addresses': FieldValue.arrayUnion([model.toMap()]),
      },
      SetOptions(merge: true),
    );
  }

  Future<List<AddressBookModel>> getAddressList(String userId) async {
    DocumentSnapshot doc = await _firestore
        .collection(FirebaseCollection.addressBook)
        .doc(userId)
        .get();

    if (doc.exists) {
      List<dynamic> addressesData = doc.get('addresses') ?? [];
      return addressesData
          .map((address) => AddressBookModel.fromMap(address))
          .toList();
    } else {
      return [];
    }
  }

  removeAddress(AddressBookModel model, String userId) async {
    await _firestore
        .collection(FirebaseCollection.addressBook)
        .doc(userId)
        .update({
          'addresses': FieldValue.arrayRemove([model.toMap()]),
        });
  }
}
