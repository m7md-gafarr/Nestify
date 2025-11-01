import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:depi_graduation_project/features/bag/widgets/bag_item_tile.dart';
import 'package:depi_graduation_project/features/bag/widgets/promo_field.dart';
import 'package:depi_graduation_project/features/bag/widgets/total_section.dart';

import '../models/bag_view_model.dart';

class BagFilledView extends StatelessWidget {
  final BagViewModel viewModel;
  final VoidCallback onCheckout;

  const BagFilledView({
    super.key,
    required this.viewModel,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            CustomSectionHeaderWidget(title: 'bag'),
            SizedBox(height: 20.h),
            ListView.separated(
              itemCount: viewModel.items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => SizedBox(height: 16.h),
              itemBuilder: (_, i) {
                final item = viewModel.items[i];
                return BagItemTile(
                  item: item,
                  onRemove: () => viewModel.removeItem(item),
                  onIncrement: () => viewModel.incrementQuantity(item),
                  onDecrement: () => viewModel.decrementQuantity(item),
                );
              },
            ),

            SizedBox(height: 20.h),
            CustomSectionHeaderWidget(title: 'promo code'),

            PromoField(
              value: viewModel.promo,
              onChanged: viewModel.addPromo,
              onClear: viewModel.clearPromo,
            ),

            SizedBox(height: 24.h),
            TotalSection(discount: viewModel.discount, total: viewModel.total),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: onCheckout,
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
