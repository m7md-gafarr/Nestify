import 'package:cloud_firestore/cloud_firestore.dart';

class RoomCategoryModel {
  final String id;
  final String name;
  final String imageUrl;
  final int order;
  final String roomId;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  RoomCategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.order,
    required this.roomId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RoomCategoryModel.fromJson(Map<String, dynamic> json, String docId) {
    return RoomCategoryModel(
      id: docId,
      name: json['name'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      order: json['order'] ?? 0,
      roomId: json['roomId'] ?? '',
      isActive: json['isActive'] ?? true,
      createdAt: (json['createdAt'] is Timestamp)
          ? (json['createdAt'] as Timestamp).toDate()
          : DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: (json['updatedAt'] is Timestamp)
          ? (json['updatedAt'] as Timestamp).toDate()
          : DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'order': order,
      'roomId': roomId,
      'isActive': isActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
