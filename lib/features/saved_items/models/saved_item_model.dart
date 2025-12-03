class SavedItemModel {
  final List<String> productId;

  SavedItemModel({required this.productId});

  Map<String, dynamic> toJson() => {"productId": productId};

  factory SavedItemModel.fromJson(Map<String, dynamic> json) {
    return SavedItemModel(
      productId: json["productId"] != null
          ? List<String>.from(json["productId"])
          : [],
    );
  }

  SavedItemModel copyWith({List<String>? productId}) {
    return SavedItemModel(productId: productId ?? this.productId);
  }
}
