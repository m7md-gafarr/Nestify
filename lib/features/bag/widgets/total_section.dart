import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalSection extends StatelessWidget {
  final double discount;
  final double total;
  const TotalSection({super.key, required this.discount, required this.total});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('total', style: textTheme.titleMedium),
            Text('\$${total.toStringAsFixed(2)}', style: textTheme.titleLarge),
          ],
        ),
        SizedBox(height: 6.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Promocode', style: textTheme.bodySmall),
            Text('-\$${discount.toStringAsFixed(2)}', style: textTheme.bodySmall),
          ],
        ),
      ],
    );
  }
}


