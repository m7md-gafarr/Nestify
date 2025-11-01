import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  RangeValues _priceRange = const RangeValues(200, 900);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RangeSlider(
        values: _priceRange,
        min: 0,
        max: 1000,
        divisions: 100,
        labels: RangeLabels(
          '\$${_priceRange.start.round()}',
          '\$${_priceRange.end.round()}',
        ),
        onChanged: (values) {
          setState(() {
            _priceRange = values;
          });
        },
      ),
    );
  }
}
