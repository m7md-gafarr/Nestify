import 'package:cloud_firestore/cloud_firestore.dart';

class BestCategoryModel {
  final String id;
  final String title;
  final String imageUrl;
  final int order;
  final List<String> products;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  BestCategoryModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.order,
    required this.products,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BestCategoryModel.fromJson(Map<String, dynamic> json, String docId) {
    return BestCategoryModel(
      id: docId,
      title: json['title'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      order: json['order'] ?? 0,
      products: List<String>.from(json['products'] ?? []),
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
      'title': title,
      'imageUrl': imageUrl,
      'order': order,
      'products': products,
      'isActive': isActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      'title': title,
      'imageUrl': imageUrl,
      'order': order,
      'products': products,
      'isActive': isActive,
      'updatedAt': updatedAt,
    };
  }

  BestCategoryModel copyWith({
    final String? id,
    final String? title,
    final String? imageUrl,
    final int? order,
    final List<String>? products,
    final bool? isActive,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) {
    return BestCategoryModel(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      order: order ?? this.order,
      products: products ?? this.products,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
