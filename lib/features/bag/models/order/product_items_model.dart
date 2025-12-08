class ProductItemsModel {
  final String id;
  final int quantity;

  ProductItemsModel({required this.id, required this.quantity});

  Map<String, dynamic> toMap() {
    return {'id': id, 'quantity': quantity};
  }

  factory ProductItemsModel.fromMap(Map<String, dynamic> map) {
    return ProductItemsModel(id: map['id'], quantity: map['quantity']);
  }
}
