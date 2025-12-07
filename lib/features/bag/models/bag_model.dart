import 'package:depi_graduation_project/features/bag/models/bag_item_model.dart';

class BagModel {
  final List<BagItemModel> items;

  BagModel({required this.items});

  Map<String, dynamic> toJson() => {
    "items": items.map((e) => e.toJson()).toList(),
  };

  factory BagModel.fromJson(Map<String, dynamic> json) {
    return BagModel(
      items: json["items"] != null
          ? (json["items"] as List)
                .map((item) => BagItemModel.fromJson(item))
                .toList()
          : [],
    );
  }

  BagModel copyWith({List<BagItemModel>? items}) {
    return BagModel(items: items ?? this.items);
  }
}
