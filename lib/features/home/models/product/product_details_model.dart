class ProductDetails {
  final Measurements measurements;
  final Composition composition;

  ProductDetails({required this.measurements, required this.composition});

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    return ProductDetails(
      measurements: Measurements.fromJson(json['measurements'] ?? {}),
      composition: Composition.fromJson(json['composition'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "measurements": measurements.toJson(),
      "composition": composition.toJson(),
    };
  }
}

class Measurements {
  final String height;
  final String width;
  final String depth;
  final String weight;

  Measurements({
    required this.height,
    required this.width,
    required this.depth,
    required this.weight,
  });

  factory Measurements.fromJson(Map<String, dynamic> json) {
    return Measurements(
      height: json['height'] ?? "",
      width: json['width'] ?? "",
      depth: json['depth'] ?? "",
      weight: json['weight'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {"height": height, "width": width, "depth": depth, "weight": weight};
  }
}

class Composition {
  final String mainMaterial;
  final String secondaryMaterial;

  Composition({required this.mainMaterial, required this.secondaryMaterial});

  factory Composition.fromJson(Map<String, dynamic> json) {
    return Composition(
      mainMaterial: json['mainMaterial'] ?? "",
      secondaryMaterial: json['secondaryMaterial'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "mainMaterial": mainMaterial,
      "secondaryMaterial": secondaryMaterial,
    };
  }
}
