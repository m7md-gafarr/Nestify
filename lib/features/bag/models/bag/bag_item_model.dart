class BagItemModel {
  final String productId;
  final int quantity;

  BagItemModel({required this.productId, required this.quantity});

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "quantity": quantity,
  };

  factory BagItemModel.fromJson(Map<String, dynamic> json) {
    return BagItemModel(
      productId: json["productId"],
      quantity: json["quantity"],
    );
  }

  BagItemModel copyWith({String? productId, int? quantity}) {
    return BagItemModel(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }
}
