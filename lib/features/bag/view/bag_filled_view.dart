import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:depi_graduation_project/features/bag/widgets/bag_item_tile.dart';
import 'package:depi_graduation_project/features/bag/widgets/promo_field.dart';
import 'package:depi_graduation_project/features/bag/widgets/total_section.dart';
import '../logic/bag/bag_cubit.dart';

class BagFilledView extends StatelessWidget {
  final VoidCallback onCheckout;

  const BagFilledView({
    super.key,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BagCubit, BagState>(
      builder: (context, state) {
        if (state is BagLoaded) {
          final bagState = state;
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60.h),
                  CustomSectionHeaderWidget(title: 'bag'),
                  SizedBox(height: 20.h),
                  ListView.separated(
                    itemCount: bagState.items.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => SizedBox(height: 16.h),
                    itemBuilder: (_, i) {
                      final item = bagState.items[i];
                      return BagItemTile(
                        item: item,
                        onRemove: () => context.read<BagCubit>().removeItem(item),
                        onIncrement: () => context.read<BagCubit>().incrementQuantity(item),
                        onDecrement: () => context.read<BagCubit>().decrementQuantity(item),
                      );
                    },
                  ),

                  SizedBox(height: 20.h),
                  CustomSectionHeaderWidget(title: 'promo code'),

                  PromoField(
                    value: bagState.promo,
                    onChanged: (value) => context.read<BagCubit>().addPromo(value),
                    onClear: () => context.read<BagCubit>().clearPromo(),
                  ),

                  SizedBox(height: 24.h),
                  TotalSection(
                    discount: bagState.discount,
                    total: bagState.total,
                  ),
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

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
