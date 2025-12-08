class PromoCodeModel {
  final String code;
  final double discountPercentage;
  final DateTime expiryDate;

  PromoCodeModel({
    required this.code,
    required this.discountPercentage,
    required this.expiryDate,
  });

  factory PromoCodeModel.fromJson(Map<String, dynamic> map) {
    return PromoCodeModel(
      code: map['code'] as String,
      discountPercentage: (map['discountPercentage'] as num).toDouble(),
      expiryDate: DateTime.parse(map['expiryDate'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'discountPercentage': discountPercentage,
      'expiryDate': expiryDate.toIso8601String(),
    };
  }
}
