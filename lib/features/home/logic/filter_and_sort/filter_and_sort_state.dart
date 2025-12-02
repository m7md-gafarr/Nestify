import 'package:flutter/material.dart';

class FilterAndSortState {
  final int sortOption;
  final RangeValues priceRange;
  final double minPrice;
  final double maxPrice;
  final String productType;
  final String color;
  final String size;
  final String quality;

  const FilterAndSortState({
    this.sortOption = 0,
    this.priceRange = const RangeValues(0, 1000),
    this.minPrice = 0,
    this.maxPrice = 1000,
    this.productType = "All",
    this.color = "All",
    this.size = "All",
    this.quality = "All",
  });

  FilterAndSortState copyWith({
    int? sortOption,
    RangeValues? priceRange,
    double? minPrice,
    double? maxPrice,
    String? productType,
    String? color,
    String? size,
    String? quality,
  }) {
    return FilterAndSortState(
      sortOption: sortOption ?? this.sortOption,
      priceRange: priceRange ?? this.priceRange,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      productType: productType ?? this.productType,
      color: color ?? this.color,
      size: size ?? this.size,
      quality: quality ?? this.quality,
    );
  }
}
