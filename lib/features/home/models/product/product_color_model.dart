import 'package:flutter/animation.dart';

class ProductColor {
  final String name;
  final Color color;

  ProductColor({required this.name, required this.color});

  factory ProductColor.fromJson(Map<String, dynamic> json) {
    return ProductColor(
      name: json['name'] ?? '',
      color: Color(int.parse(json['color'].replaceFirst('#', '0xff'))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'color': '#${color.value.toRadixString(16).substring(2)}',
    };
  }
}
