import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:flutter/material.dart';

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
            CustomSectionHeaderWidget(title: 'total'),
            CustomSectionHeaderWidget(title: '\$${total.toStringAsFixed(2)}'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Promocode', style: textTheme.bodyMedium),
            Text(
              '-\$${discount.toStringAsFixed(2)}',
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
