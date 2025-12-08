import 'package:depi_graduation_project/features/bag/models/order/contact_info_model.dart';
import 'package:depi_graduation_project/features/bag/models/order/delivery_details_model.dart';
import 'package:depi_graduation_project/features/bag/models/order/payment_details_model.dart';
import 'package:depi_graduation_project/features/bag/models/order/product_items_model.dart';

class OrderModel {
  final String id;
  final List<ProductItemsModel> productItems;
  final ContactInfo contactInfo;
  final DeliveryDetails deliveryDetails;
  final PaymentDetails paymentDetails;
  final double total;
  final DateTime createdAt;

  OrderModel({
    required this.id,
    required this.productItems,
    required this.contactInfo,
    required this.deliveryDetails,
    required this.paymentDetails,
    required this.total,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "productItems": productItems.map((item) => item.toMap()).toList(),
      "contactInfo": contactInfo.toMap(),
      "deliveryDetails": deliveryDetails.toMap(),
      "paymentDetails": paymentDetails.toMap(),
      "total": total,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      productItems: List<ProductItemsModel>.from(
        (map['productItems'] as List<dynamic>).map<ProductItemsModel>(
          (item) => ProductItemsModel.fromMap(item),
        ),
      ),
      contactInfo: ContactInfo.fromMap(map['contactInfo']),
      deliveryDetails: DeliveryDetails.fromMap(map['deliveryDetails']),
      paymentDetails: PaymentDetails.fromMap(map['paymentDetails']),
      total: (map['total'] ?? 0).toDouble(),
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
