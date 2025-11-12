import 'package:flutter/material.dart';

class FilterState {
  final RangeValues priceRange;
  final String productType;
  final String color;
  final String size;
  final String quality;

  const FilterState({
    this.priceRange = const RangeValues(0, 1000),
    this.productType = "All",
    this.color = "All",
    this.size = "All",
    this.quality = "All",
  });

  FilterState copyWith({
    RangeValues? priceRange,
    String? productType,
    String? color,
    String? size,
    String? quality,
  }) {
    return FilterState(
      priceRange: priceRange ?? this.priceRange,
      productType: productType ?? this.productType,
      color: color ?? this.color,
      size: size ?? this.size,
      quality: quality ?? this.quality,
    );
  }
}
