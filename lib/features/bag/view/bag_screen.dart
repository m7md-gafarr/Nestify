import 'package:depi_graduation_project/components/custom_section_header_widget.dart';
import 'package:depi_graduation_project/features/bag/logic/bag/bag_cubit.dart';
import 'package:depi_graduation_project/features/bag/widgets/bag_empty_widget.dart';
import 'package:depi_graduation_project/features/bag/widgets/bag_item_tile.dart';
import 'package:depi_graduation_project/features/bag/widgets/total_section.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<BagCubit>().loadBagItems(
            FirebaseAuth.instance.currentUser!.uid,
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),
                CustomSectionHeaderWidget(title: 'bag'),
                SizedBox(height: 35.h),
                BlocBuilder<BagCubit, BagState>(
                  builder: (context, state) {
                    if (state is BagSuccess) {
                      if (state.products.isEmpty) {
                        return const BagEmptyWidget();
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.separated(
                            itemCount: state.products.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (_, __) => SizedBox(height: 16.h),
                            itemBuilder: (_, i) {
                              final item = state.products[i];
                              return BagItemTile(
                                item: item,
                                quantity: state.bagModel.items
                                    .firstWhere(
                                      (bagItem) => bagItem.productId == item.id,
                                    )
                                    .quantity,
                                onRemove: () {
                                  context.read<BagCubit>().removeItem(
                                    userId:
                                        FirebaseAuth.instance.currentUser!.uid,
                                    productId: item.id,
                                  );
                                },
                                onIncrement: () {
                                  context.read<BagCubit>().incrementQuantity(
                                    userId:
                                        FirebaseAuth.instance.currentUser!.uid,
                                    productId: item.id,
                                  );
                                },
                                onDecrement: () {
                                  context.read<BagCubit>().decrementQuantity(
                                    userId:
                                        FirebaseAuth.instance.currentUser!.uid,
                                    productId: item.id,
                                  );
                                },
                              );
                            },
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            'Promo Code',
                            style: Theme.of(context).textTheme.headlineSmall!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                ),
                          ),
                          SizedBox(height: 8.h),
                          TextField(
                            controller: TextEditingController(text: 'nestify'),
                            decoration: InputDecoration(hintText: 'Code'),
                          ),
                          SizedBox(height: 24.h),
                          TotalSection(discount: 12, total: 0),
                          SizedBox(height: 24.h),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Continue'),
                          ),
                        ],
                      );
                    } else {
                      return const BagEmptyWidget();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
