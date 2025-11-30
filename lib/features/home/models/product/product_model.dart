import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:depi_graduation_project/features/home/models/product/product_color_model.dart';
import 'package:depi_graduation_project/features/home/models/product/product_details_model.dart';
import 'package:depi_graduation_project/features/home/models/product/review_model.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String categoryId;
  final String roomId;
  final List<ProductColor> colors;
  final ProductDetails? details;
  final List<ReviewModel> reviews;
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
    required this.colors,
    required this.productType,
    required this.quality,
    required this.size,
    required this.stock,
    required this.isActive,
    required this.isFeatured,
    required this.createdAt,
    required this.updatedAt,
    required this.details,
    required this.reviews,
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
      colors:
          (json['colors'] as List<dynamic>?)
              ?.map((e) => ProductColor.fromJson(e))
              .toList() ??
          [],
      productType: json['productType'] ?? '',
      quality: json['quality'] ?? '',
      size: json['size'] ?? '',
      stock: (json['stock'] ?? 0),
      isActive: json['isActive'] ?? true,
      isFeatured: json['isFeatured'] ?? false,
      createdAt: (json['createdAt'] is Timestamp)
          ? (json['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
      updatedAt: (json['updatedAt'] is Timestamp)
          ? (json['updatedAt'] as Timestamp).toDate()
          : DateTime.now(),
      details: json['details'] != null
          ? ProductDetails.fromJson(json['details'])
          : null,
      reviews:
          (json['reviews'] as List<dynamic>?)
              ?.map((e) => ReviewModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
      'roomId': roomId,
      'colors': colors.map((c) => c.toJson()).toList(),
      'productType': productType,
      'quality': quality,
      'size': size,
      'stock': stock,
      'isActive': isActive,
      'isFeatured': isFeatured,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'details': details?.toJson(),
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
