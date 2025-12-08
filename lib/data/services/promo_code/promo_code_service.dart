import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/core/constants/firebase_collection.dart';
import 'package:depi_graduation_project/features/bag/models/promo_code/promo_code_model.dart';

class PromoCodeService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<PromoCodeModel?> getPromoCodeByCode(String code) async {
    final querySnapshot = await _db
        .collection(FirebaseCollection.promoCode)
        .where('code', isEqualTo: code)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return PromoCodeModel.fromJson(querySnapshot.docs.first.data());
    } else {
      return null;
    }
  }

  Future<Map<String, dynamic>?> addPromoCodeByCode(
    PromoCodeModel promoCode,
  ) async {
    await _db
        .collection(FirebaseCollection.promoCode)
        .doc(promoCode.code)
        .set(promoCode.toJson());
    null;
    return null;
  }
}
