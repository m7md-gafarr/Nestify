import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String categoryId;
  final String roomId;
  final String color;
  final String productType;
  final String quality;
  final String size;
  final int stock;
  final bool isActive;
  final bool isFeatured;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
    required this.roomId,
    required this.color,
    required this.productType,
    required this.quality,
    required this.size,
    required this.stock,
    required this.isActive,
    required this.isFeatured,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json, String docId) {
    return ProductModel(
      id: docId,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      imageUrl: json['imageUrl'] ?? '',
      categoryId: json['categoryId'] ?? '',
      roomId: json['roomId'] ?? '',
      color: json['color'] ?? '',
      productType: json['productType'] ?? '',
      quality: json['quality'] ?? '',
      size: json['size'] ?? '',
      stock: (json['stock'] ?? 0) is int
          ? json['stock']
          : (json['stock'] ?? 0).toInt(),
      isActive: json['isActive'] ?? true,
      isFeatured: json['isFeatured'] ?? false,
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
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
      'roomId': roomId,
      'color': color,
      'productType': productType,
      'quality': quality,
      'size': size,
      'stock': stock,
      'isActive': isActive,
      'isFeatured': isFeatured,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
